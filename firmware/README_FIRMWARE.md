# Dummy 13 V3 firmware — status: v1 skeleton, NOT flash-ready

The design invariant: the XIAO hosts the **same two WiFi contracts as the sim**
(`PROTOCOL.md`) — scanner core on :8765, command verbs on :8766, byte-identical JSON.
The brain's bridge points at `ws://<robot-ip>` instead of `ws://localhost` and nothing
else changes.

## What exists (generated, verified where stated)
- `policy_walk.h` — the walking champion exported to C arrays with a dependency-free
  forward pass, **verified 1e-6 against torch on 500 random inputs** (`_export_firmware.py`).
- `config_robot.h` — **generated from the sim** (stand pose, joint limits/order, action
  scaling, slew, PWM channel map). The sim is the single source of truth; regenerate
  after any model change (`python3 _export_config` block inside the export script).
- `dummy13_v3/dummy13_v3.ino` — the v1 sketch: 50 Hz loop (pots→IMU→obs→policy→slewed
  PWM), fall detection, both WS servers, verb dispatch.

## Honest gaps — the pre-flash checklist (do NOT skip)
1. ~~Obs-fidelity fine-tune~~ **GREEN (2026-07-28)**: `omni_pot_A` evaluated under
   the COMPLETE hardware obs model (pot positions + noise + nominal z + zeroed root
   lin-vel = exactly `buildObs()`): mean |err| 0.086, 0/60 falls, style intact
   (jerk 0.587, head 3.75).
   **Superseded (2026-07-30) by `omni_blsh_A`** — same recipe + per-episode
   randomized MG90S gear backlash U[0, 2.5°] (`V2_BACKLASH=2.5r`, `_night31.sh`),
   after a zero-shot sweep showed right-arc falls inside the command envelope at
   ≥1.5° of gear play. Battery vs pot_A at 0/1.5/2.5° fixed slop: err
   .088/.099/.107 vs .089/.108/.119, falls 0/120 vs 1/120, clearance parity,
   style intact (jerk 0.594, head 3.88, armcorr +0.55). This policy IS the one
   baked into `policy_walk.h` (re-exported, C-verified 1.2e-6, recompiled 43%
   flash). Practical corollary for the bench: keep total joint slop under ~1°
   (snug screws, fresh servos) and test turns BOTH ways — right turns degrade
   first as gears wear.
2. ~~Compile verification~~ **GREEN**: compiles for XIAO_ESP32S3 at 41% flash /
   16% RAM (the "prototypes: line too long" note is a benign ctags quirk of the
   1.5 MB weight arrays).
3. **Bench calibration before first stand**: per-servo `PULSE_CENTER_US` trim and the
   pot `POT_SCALE/POT_OFF` map (drive each servo to known angles, read the ADC, fit).
   One leg on the bench first — same staged rule as purchasing.
4. **get_up is NOT in v1** (reports fallen + gentle hold; the sim's retry chain is a
   3-policy state machine — it ports in v2). jump is refused. Sim/firmware verb
   divergence: hardware verbs are non-blocking; the brain polls `status` (it already
   does).
5. `wifi_secrets.h` is user-created (`WIFI_SSID`/`WIFI_PASS`), never committed.

## Sizing sanity (measured/computed)
- Policy: 70→256→256→19, ~355 KB of float32 — fits flash trivially; ~90 k MAC/tick
  × 50 Hz ≈ 4.5 MMAC/s — far under the S3's budget.
- JSON packets match the sim's sizes (~1.5 KB scan frame at 16 Hz ≈ 24 KB/s — fine).
