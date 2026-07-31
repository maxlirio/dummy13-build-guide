/* DUMMY 13 V3 FIRMWARE (v1) — XIAO ESP32S3 Sense
 *
 * The same two WiFi contracts as the sim (PROTOCOL.md, byte-identical JSON):
 *   ws://<ip>:8765  scanner core   {t,pose,n,fov,zoff,rmax,d[64]}
 *   ws://<ip>:8766  command verbs  {id,cmd,...} -> {id,ok,detail} + events
 * The brain cannot tell sim from hardware; that invariant is the whole design.
 *
 * WHAT IS REAL IN v1:
 *   - 50 Hz control loop: IMU + pot obs -> exported walk policy (policy_walk.h,
 *     C forward verified 1e-6 vs torch) -> slew-clamped PWM targets.
 *   - Verbs: walk/turn/arc/stop/goto/look_down/scan/scan_sweep/status.
 *   - Fall detection (gravity vector) with honest {"event":"fell"}.
 * WHAT IS STAGED (documented, not faked):
 *   - get_up: v1 goes limp + reports fallen (the retrying getup chain is a
 *     state machine over 3 policies — ports in v2). jump: refused in v1.
 *   - Root z + linear velocity are unobservable -> nominal z + IMU/gait
 *     estimates. DO NOT FLASH until the estimate-faithful sim fine-tune
 *     (night29 'pot' run) is evaluated green. See README_FIRMWARE.md.
 *
 * Libraries: Adafruit PWM Servo Driver, ArduinoJson, WebSockets (links2004),
 *            SparkFun VL53L5CX. Board: XIAO_ESP32S3.
 */
#include <WiFi.h>
#include <Wire.h>
#include <math.h>
#include <ArduinoJson.h>
#include <WebSocketsServer.h>
#include <Adafruit_PWMServoDriver.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <Preferences.h>
#include "cal_page.h"          // generated: the calibration website, served at /
#include <SparkFun_VL53L5CX_Library.h>

#include "config_robot.h"     // sim-exported: Q_STAND/Q_LO/Q_HI/PWM_CHAN/ACT_SCALE/SLEW
#include "policy_walk.h"      // sim-exported: verified C forward
#include "wifi_secrets.h"     // #define WIFI_SSID / WIFI_PASS (user-created)
#include "esp_camera.h"        // OV2640 on the XIAO ESP32S3 Sense
#include "camera_pins.h"       // Sense expansion-board pin map

// ---------------- hardware ----------------
Adafruit_PWMServoDriver pca0(0x40), pca1(0x41);
SparkFun_VL53L5CX tof;
WebSocketsServer wsScan(8765), wsCmd(8766);
WebServer httpd(80);
Preferences prefs;

// CD74HC4067 muxes: shared select pins, two analog inputs (see build guide wiring)
static const int MUX_S[4] = {3, 4, 7, 8};       // select lines D2/D3/D8/D9 (shared)
// NOT 2/3/4/5: GPIO2 IS A1 (mux1's ADC out) and GPIO5 IS I2C SDA on the
// XIAO ESP32S3 — the old map shorted the selects into both. A0/A1 are ADC1,
// so pot reads stay WiFi-safe.
static const int MUX_A[2] = {A0, A1};           // mux0 -> joints 0-15, mux1 -> 16-18
static const int MPU_ADDR = 0x68;

// per-servo pulse calibration: center/us-per-rad; TRIM MUST BE BENCH-CALIBRATED
static float PULSE_CENTER_US[N_JOINTS];
static float PULSE_PER_RAD = 636.6f;            // (2500-500)us / pi rad, stock horns
static float POT_SCALE[N_JOINTS], POT_OFF[N_JOINTS];   // bench-calibrated pot->rad

// ---------------- state ----------------
static float q_meas[N_JOINTS];                  // pot-measured joint angles (rad)
static float q_prev[N_JOINTS];
static float tgt[N_JOINTS];                     // slewed servo targets
static float prev_act[N_JOINTS];
static float cmd_vec[3] = {0, 0, 0};            // walk fwd / lat / yaw-rate
static float grav[3] = {0, 0, -1};              // body-frame gravity (complementary)
static float gyro_z = 0, yaw_est = 0;
static float pos_est[2] = {0, 0};               // gait odometry (coarse, honest)
static bool fallen = false, armed = false;
static uint32_t tick = 0;

static void calSave();                          // defined below setup-side
static void calLoad();

// ---------------- small helpers ----------------
static float clampf(float v, float lo, float hi) { return v < lo ? lo : (v > hi ? hi : v); }

static void writeServo(int j, float rad) {
  int board = PWM_CHAN[j] / 16, ch = PWM_CHAN[j] % 16;
  float us = PULSE_CENTER_US[j] + rad * PULSE_PER_RAD;
  us = clampf(us, 500, 2500);
  (board == 0 ? pca0 : pca1).writeMicroseconds(ch, (int)us);
}

static void readPots() {
  for (int j = 0; j < N_JOINTS; j++) {
    int mux = j / 16, ch = j % 16;
    for (int s = 0; s < 4; s++) digitalWrite(MUX_S[s], (ch >> s) & 1);
    delayMicroseconds(5);
    int raw = analogRead(MUX_A[mux]);
    q_prev[j] = q_meas[j];
    q_meas[j] = raw * POT_SCALE[j] + POT_OFF[j];
  }
}

static void readIMU() {
  Wire.beginTransmission(MPU_ADDR); Wire.write(0x3B); Wire.endTransmission(false);
  Wire.requestFrom(MPU_ADDR, 14);
  int16_t ax = Wire.read() << 8 | Wire.read(), ay = Wire.read() << 8 | Wire.read(),
          az = Wire.read() << 8 | Wire.read();
  Wire.read(); Wire.read();                                    // temp
  int16_t gx = Wire.read() << 8 | Wire.read(), gy = Wire.read() << 8 | Wire.read(),
          gz = Wire.read() << 8 | Wire.read();
  const float A = 16384.f, G = 131.f * 57.2958f;               // raw->g, raw->rad/s
  float a[3] = {ax / A, ay / A, az / A};
  float w[3] = {gx / G, gy / G, gz / G};
  // complementary filter on the gravity direction (rotate by -w*dt, blend accel)
  const float dt = 1.0f / CTRL_HZ, k = 0.02f;
  float gx2 = grav[0] + (w[1] * grav[2] - w[2] * grav[1]) * -dt;
  float gy2 = grav[1] + (w[2] * grav[0] - w[0] * grav[2]) * -dt;
  float gz2 = grav[2] + (w[0] * grav[1] - w[1] * grav[0]) * -dt;
  float n = sqrtf(a[0]*a[0] + a[1]*a[1] + a[2]*a[2]);
  if (n > 0.5f && n < 1.5f) {                                  // trust accel when ~1g
    gx2 = (1-k)*gx2 - k*a[0]; gy2 = (1-k)*gy2 - k*a[1]; gz2 = (1-k)*gz2 - k*a[2];
  }
  n = sqrtf(gx2*gx2 + gy2*gy2 + gz2*gz2) + 1e-6f;
  grav[0]=gx2/n; grav[1]=gy2/n; grav[2]=gz2/n;
  gyro_z = w[2];
  yaw_est += w[2] * dt;                                        // drifts; brain re-anchors
}

// OBS LAYOUT — MUST match the sim's 70-dim vector (see config_robot.h notes).
static void buildObs(float* obs) {
  int i = 0;
  obs[i++] = 0.226f;                                           // z: nominal (gap, documented)
  // quat from gravity + yaw_est (yaw-invariant policy uses gravity; quat kept consistent)
  float pitch = asinf(clampf(-grav[1], -1, 1)), roll = asinf(clampf(grav[0], -1, 1));
  float cy=cosf(yaw_est/2), sy=sinf(yaw_est/2), cp=cosf(pitch/2), sp=sinf(pitch/2),
        cr=cosf(roll/2), sr=sinf(roll/2);
  obs[i++] = cy*cp*cr + sy*sp*sr; obs[i++] = cy*cp*sr - sy*sp*cr;
  obs[i++] = sy*cp*sr + cy*sp*cr; obs[i++] = sy*cp*cr - cy*sp*sr;
  for (int j = 0; j < N_JOINTS; j++) obs[i++] = q_meas[j];
  obs[i++] = 0; obs[i++] = 0; obs[i++] = 0;                    // root lin vel: gap (0-est)
  obs[i++] = 0; obs[i++] = 0; obs[i++] = gyro_z;               // root ang vel: gyro z real
  for (int j = 0; j < N_JOINTS; j++)
    obs[i++] = clampf((q_meas[j] - q_prev[j]) * CTRL_HZ, -30, 30);
  for (int j = 0; j < N_JOINTS; j++) obs[i++] = prev_act[j];
  obs[i++] = cmd_vec[0]; obs[i++] = cmd_vec[1]; obs[i++] = cmd_vec[2];
}

static bool uprightOK() { return -grav[2] > 0.5f; }

// ---------------- 50 Hz control ----------------
static void controlTick() {
  readPots(); readIMU();
  fallen = !uprightOK();
  if (!armed) return;
  if (fallen) {                                                 // v1: go limp + report
    for (int j = 0; j < N_JOINTS; j++) writeServo(j, Q_STAND[j]); // gentle hold, no thrash
    return;
  }
  static float obs[POLICY_WALK_OBS], act[POLICY_WALK_ACT];
  buildObs(obs);
  policy_walk_forward(obs, act);
  const float dt = 1.0f / CTRL_HZ, slew = SLEW_RADPS * dt;
  for (int j = 0; j < N_JOINTS; j++) {
    prev_act[j] = act[j];
    float want = clampf(Q_STAND[j] + act[j] * ACT_SCALE, Q_LO[j], Q_HI[j]);
    tgt[j] += clampf(want - tgt[j], -slew, slew);
    writeServo(j, tgt[j]);
  }
  // coarse gait odometry: commanded velocity integrated in yaw frame (honest label)
  pos_est[0] += cmd_vec[0] * cosf(yaw_est + M_PI/2) * dt;
  pos_est[1] += cmd_vec[0] * sinf(yaw_est + M_PI/2) * dt;
  tick++;
}

// ---------------- 8765 scanner stream ----------------
static void streamScan() {
  if (tick % 3) return;                                        // ~16 Hz
  StaticJsonDocument<2048> d;
  d["t"] = tick / (float)CTRL_HZ;
  JsonObject p = d.createNestedObject("pose");
  p["x"] = pos_est[0]; p["y"] = pos_est[1]; p["z"] = 0.226; p["yaw"] = yaw_est;
  d["n"] = 8; d["fov"] = 45.0; d["zoff"] = 0.09; d["rmax"] = 1.0;
  JsonArray a = d.createNestedArray("d");
  VL53L5CX_ResultsData r;
  if (tof.isDataReady() && tof.getRangingData(&r)) {
    for (int i = 0; i < 64; i++) {
      float m = r.distance_mm[i] / 1000.0f;
      a.add((r.target_status[i] == 5 && m < 1.0f) ? m : 1.0f);
    }
  } else for (int i = 0; i < 64; i++) a.add(1.0f);
  String out; serializeJson(d, out);
  wsScan.broadcastTXT(out);
}

// ---------------- 8766 verbs ----------------
static void sendCmdReply(uint8_t client, JsonDocument& req, bool ok, const char* detail) {
  StaticJsonDocument<256> r;
  if (!req["id"].isNull()) r["id"] = req["id"];
  r["ok"] = ok; r["detail"]["note"] = detail;
  String out; serializeJson(r, out);
  wsCmd.sendTXT(client, out);
}

static void onCmd(uint8_t client, uint8_t* payload, size_t len) {
  StaticJsonDocument<512> req;
  if (deserializeJson(req, payload, len)) { return; }
  const char* c = req["cmd"] | "";
  if (!strcmp(c, "status")) {
    StaticJsonDocument<256> r;
    if (!req["id"].isNull()) r["id"] = req["id"];
    r["ok"] = true;
    r["detail"]["state"] = fallen ? "fallen" : "standing";
    r["detail"]["pose"]["x"] = pos_est[0]; r["detail"]["pose"]["y"] = pos_est[1];
    r["detail"]["pose"]["yaw"] = yaw_est;
    String out; serializeJson(r, out); wsCmd.sendTXT(client, out);
  } else if (!strcmp(c, "walk"))  { cmd_vec[0]=clampf(req["speed"]|0.10f,0,0.14f); cmd_vec[1]=0; cmd_vec[2]=0; sendCmdReply(client,req,true,"walking"); }
  else if (!strcmp(c, "turn"))    { cmd_vec[0]=0; cmd_vec[1]=0; cmd_vec[2]=clampf(req["rate"]|0.6f,-0.7f,0.7f); sendCmdReply(client,req,true,"turning"); }
  else if (!strcmp(c, "arc"))     { cmd_vec[0]=clampf(req["speed"]|0.10f,0,0.14f); cmd_vec[2]=clampf(req["rate"]|0.4f,-0.7f,0.7f); sendCmdReply(client,req,true,"arcing"); }
  else if (!strcmp(c, "stop"))    { cmd_vec[0]=cmd_vec[1]=cmd_vec[2]=0; sendCmdReply(client,req,true,"stopped"); }
  else if (!strcmp(c, "arm"))     { armed = true;  sendCmdReply(client,req,true,"armed"); }
  else if (!strcmp(c, "disarm"))  { armed = false; sendCmdReply(client,req,true,"disarmed"); }
  else if (!strcmp(c, "get_up"))  { sendCmdReply(client,req,false,"v1 firmware: getup chain not on-device yet — pick the robot up"); }
  else if (!strcmp(c, "jump"))    { sendCmdReply(client,req,false,"refused in v1 firmware"); }
  // ---- calibration verbs (used by the on-robot calibration page at /) ----
  else if (!strcmp(c, "cal_servo")) {          // nudge/set one servo's center pulse
    int j = req["joint"] | -1;
    if (j >= 0 && j < N_JOINTS) {
      if (!req["us"].isNull())   PULSE_CENTER_US[j] = clampf(req["us"], 800, 2200);
      if (!req["nudge"].isNull())PULSE_CENTER_US[j] = clampf(PULSE_CENTER_US[j] + (float)req["nudge"], 800, 2200);
      writeServo(j, Q_STAND[j]);               // show the result immediately
      StaticJsonDocument<192> r; r["id"]=req["id"]; r["ok"]=true;
      r["detail"]["joint"]=j; r["detail"]["us"]=PULSE_CENTER_US[j];
      String out; serializeJson(r,out); wsCmd.sendTXT(client,out);
    } else sendCmdReply(client,req,false,"bad joint");
  }
  else if (!strcmp(c, "cal_pose")) {           // drive ALL servos to a named pose
    const char* p = req["pose"] | "stand";
    for (int j = 0; j < N_JOINTS; j++) {
      float a = Q_STAND[j];
      if (!strcmp(p, "zero")) a = 0;
      writeServo(j, a); tgt[j] = a;
    }
    sendCmdReply(client,req,true,p);
  }
  else if (!strcmp(c, "cal_read")) {           // raw pots + gravity, for the wizard
    StaticJsonDocument<1024> r; r["id"]=req["id"]; r["ok"]=true;
    JsonArray raw = r["detail"].createNestedArray("pot_raw");
    for (int j = 0; j < N_JOINTS; j++) {
      int mux = j / 16, ch = j % 16;
      for (int s2 = 0; s2 < 4; s2++) digitalWrite(MUX_S[s2], (ch >> s2) & 1);
      delayMicroseconds(5);
      raw.add(analogRead(MUX_A[mux]));
    }
    JsonArray g = r["detail"].createNestedArray("grav");
    g.add(grav[0]); g.add(grav[1]); g.add(grav[2]);
    String out; serializeJson(r,out); wsCmd.sendTXT(client,out);
  }
  else if (!strcmp(c, "cal_pot")) {            // record a (pose,reading) pair -> fit
    // two-point fit done page-side; this verb just applies the result
    int j = req["joint"] | -1;
    if (j >= 0 && j < N_JOINTS && !req["scale"].isNull() && !req["off"].isNull()) {
      POT_SCALE[j] = req["scale"]; POT_OFF[j] = req["off"];
      sendCmdReply(client,req,true,"pot cal set");
    } else sendCmdReply(client,req,false,"need joint+scale+off");
  }
  else if (!strcmp(c, "cal_save")) { calSave(); sendCmdReply(client,req,true,"saved to flash"); }
  else                            { sendCmdReply(client,req,false,"unknown verb in v1"); }
  // NOTE: hardware verbs are NON-BLOCKING (sim verbs block) — v1 documents this
  // divergence; the brain's bridge already polls status, which covers it.
}

// ---------------- setup / loop ----------------
static void calLoad() {
  prefs.begin("dummy13", true);
  for (int j = 0; j < N_JOINTS; j++) {
    char k[8];
    snprintf(k, 8, "c%d", j); PULSE_CENTER_US[j] = prefs.getFloat(k, 1500);
    snprintf(k, 8, "s%d", j); POT_SCALE[j] = prefs.getFloat(k, 0.0015f);
    snprintf(k, 8, "o%d", j); POT_OFF[j] = prefs.getFloat(k, -3.07f);
  }
  prefs.end();
}
static void calSave() {
  prefs.begin("dummy13", false);
  for (int j = 0; j < N_JOINTS; j++) {
    char k[8];
    snprintf(k, 8, "c%d", j); prefs.putFloat(k, PULSE_CENTER_US[j]);
    snprintf(k, 8, "s%d", j); prefs.putFloat(k, POT_SCALE[j]);
    snprintf(k, 8, "o%d", j); prefs.putFloat(k, POT_OFF[j]);
  }
  prefs.end();
}

bool camReady = false;
bool camInit() {
  camera_config_t c = {};
  c.ledc_channel = LEDC_CHANNEL_0; c.ledc_timer = LEDC_TIMER_0;
  c.pin_d0 = Y2_GPIO_NUM;  c.pin_d1 = Y3_GPIO_NUM;  c.pin_d2 = Y4_GPIO_NUM;
  c.pin_d3 = Y5_GPIO_NUM;  c.pin_d4 = Y6_GPIO_NUM;  c.pin_d5 = Y7_GPIO_NUM;
  c.pin_d6 = Y8_GPIO_NUM;  c.pin_d7 = Y9_GPIO_NUM;
  c.pin_xclk = XCLK_GPIO_NUM; c.pin_pclk = PCLK_GPIO_NUM; c.pin_vsync = VSYNC_GPIO_NUM;
  c.pin_href = HREF_GPIO_NUM; c.pin_sccb_sda = SIOD_GPIO_NUM; c.pin_sccb_scl = SIOC_GPIO_NUM;
  c.pin_pwdn = PWDN_GPIO_NUM; c.pin_reset = RESET_GPIO_NUM;
  c.xclk_freq_hz = 20000000;
  c.pixel_format = PIXFORMAT_JPEG;
  c.frame_size = FRAMESIZE_VGA;              // 640x480, contract default
  c.jpeg_quality = 12;
  c.fb_count = 2;
  c.fb_location = CAMERA_FB_IN_PSRAM;
  c.grab_mode = CAMERA_GRAB_LATEST;          // /frame.jpg = freshest, never blocks
  camReady = (esp_camera_init(&c) == ESP_OK);
  return camReady;
}

void setup() {
  Wire.begin();
  pca0.begin(); pca0.setPWMFreq(50);
  pca1.begin(); pca1.setPWMFreq(50);
  for (int s = 0; s < 4; s++) pinMode(MUX_S[s], OUTPUT);
  for (int j = 0; j < N_JOINTS; j++) {
    PULSE_CENTER_US[j] = 1500;                 // bench-trim per servo before first stand!
    POT_SCALE[j] = 0.0015f; POT_OFF[j] = -3.07f;  // bench-calibrate!
    tgt[j] = Q_STAND[j]; prev_act[j] = 0;
  }
  tof.begin(); tof.setResolution(64); tof.setRangingFrequency(15); tof.startRanging();
  WiFi.begin(WIFI_SSID, WIFI_PASS);
  while (WiFi.status() != WL_CONNECTED) delay(200);
  calLoad();                                   // persisted calibration overrides defaults
  MDNS.begin("dummy13");                       // -> http://dummy13.local
  httpd.on("/", []() { httpd.send_P(200, "text/html", CAL_PAGE); });
  // PROTOCOL.md section 3: freshest headcam JPEG for host-side detection.
  // Camera inits lazily on first request so a broken/absent sensor can never
  // stall the control loop at boot.
  httpd.on("/frame.jpg", []() {
    if (!camReady && !camInit()) { httpd.send(503, "text/plain", "no camera"); return; }
    camera_fb_t* fb = esp_camera_fb_get();
    if (!fb) { httpd.send(503, "text/plain", "capture failed"); return; }
    httpd.sendHeader("X-Frame-TS", String(millis()));
    httpd.setContentLength(fb->len);
    httpd.send(200, "image/jpeg", "");
    httpd.sendContent((const char*)fb->buf, fb->len);
    esp_camera_fb_return(fb);
  });
  httpd.begin();
  wsScan.begin();
  wsCmd.begin();
  wsCmd.onEvent([](uint8_t c, WStype_t t, uint8_t* p, size_t l) {
    if (t == WStype_TEXT) onCmd(c, p, l);
  });
}

void loop() {
  static uint32_t last = 0;
  uint32_t now = micros();
  if (now - last >= 1000000UL / CTRL_HZ) {
    last = now;
    controlTick();
    streamScan();
  }
  wsScan.loop(); wsCmd.loop(); httpd.handleClient();
}
