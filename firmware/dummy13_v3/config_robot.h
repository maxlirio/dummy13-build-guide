// AUTO-GENERATED from the SIM by _export_config.py — the single source of truth.
// Action contract: target_rad[j] = clamp(Q_STAND[j] + act[j]*ACT_SCALE, Q_LO, Q_HI),
// slewed at SLEW_RADPS, written at CTRL_HZ. Real MG90S/SG90 ARE position servos;
// the PD in sim (kp=5,kd=0.15) models their internal loop — firmware only writes targets.
#pragma once
#define N_JOINTS 19
#define CTRL_HZ 50
#define ACT_SCALE 0.4f
#define SLEW_RADPS 3.0f
static const float Q_STAND[N_JOINTS] = {0.069813f,0.026180f,-0.209440f,0.174533f,0.000000f,0.069813f,-0.026180f,-0.209440f,0.174533f,0.000000f,0.000000f,0.000000f,0.000000f,0.523599f,0.000000f,0.000000f,0.523599f,0.000000f,0.000000f};
static const float Q_LO[N_JOINTS] = {-0.959931f,-0.610865f,-2.094395f,-0.785398f,-0.349066f,-0.959931f,-0.610865f,-2.094395f,-0.785398f,-0.349066f,-0.261799f,-1.134464f,-0.139626f,0.000000f,-1.134464f,-0.610865f,0.000000f,-0.698132f,-0.698132f};
static const float Q_HI[N_JOINTS] = {1.134464f,0.610865f,0.000000f,0.436332f,0.349066f,1.134464f,0.610865f,0.000000f,0.436332f,0.349066f,0.698132f,0.959931f,0.610865f,2.094395f,0.959931f,0.139626f,2.094395f,0.698132f,0.698132f};
static const char* JOINT_NAMES[N_JOINTS] = {"hip_pitch_l","hip_roll_l","knee_l","ankle_pitch_l","ankle_roll_l","hip_pitch_r","hip_roll_r","knee_r","ankle_pitch_r","ankle_roll_r","spine_pitch","shoulder_pitch_l","shoulder_roll_l","elbow_l","shoulder_pitch_r","shoulder_roll_r","elbow_r","hip_yaw_l","hip_yaw_r"};
static const unsigned char PWM_CHAN[N_JOINTS] = {0,1,2,3,4,5,6,7,8,9,16,17,18,19,20,21,22,10,11}; // board*16+ch, joint order
// OBS LAYOUT (70): [z, quat(4), joints(19), qvel(root6+joints19... clipped +-30), prev_action(19), cmd(3)]
// KNOWN HARDWARE OBS GAPS (v1): root z + root linear velocity are NOT directly
// measurable -> v1 uses nominal z=0.226 + kinematic/IMU estimates; a sim fine-tune
// with those exact estimates substituted (pot obs run = night29) MUST land before flash.