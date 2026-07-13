/* Dummy 13 policy inference + firmware post-process. Portable C99.
 * Self-test: cc -O2 dummy13_infer.c -lm -o d13test; echo "<obs csv>" | ./d13test [int8]
 * On ESP32-S3 call d13_policy() then d13_firmware_step() every control tick (50 Hz).
 */
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "dummy13_policy.h"

static void layer_f(const float *w, const float *b, const float *x, float *y,
                    int nin, int nout, int act) {
    for (int o = 0; o < nout; o++) {
        float s = b[o];
        const float *wr = w + (long)o * nin;
        for (int i = 0; i < nin; i++) s += wr[i] * x[i];
        y[o] = act ? tanhf(s) : s;
    }
}
static void layer_q(const signed char *w, const float *sc, const float *b,
                    const float *x, float *y, int nin, int nout, int act) {
    for (int o = 0; o < nout; o++) {
        float s = 0.f;
        const signed char *wr = w + (long)o * nin;
        for (int i = 0; i < nin; i++) s += (float)wr[i] * x[i];
        s = s * sc[o] + b[o];
        y[o] = act ? tanhf(s) : s;
    }
}

/* obs[D13_NOBS] -> action[D13_NU] (unclipped net output; firmware clips) */
void d13_policy(const float *obs, float *action, int use_int8) {
    static float h1[D13_H], h2[D13_H];
    if (use_int8) {
        layer_q(d13_w0q, d13_w0s, d13_b0, obs, h1, D13_NOBS, D13_H, 1);
        layer_q(d13_w1q, d13_w1s, d13_b1, h1, h2, D13_H, D13_H, 1);
        layer_q(d13_w2q, d13_w2s, d13_b2, h2, action, D13_H, D13_NU, 0);
    } else {
        layer_f(d13_w0, d13_b0, obs, h1, D13_NOBS, D13_H, 1);
        layer_f(d13_w1, d13_b1, h1, h2, D13_H, D13_H, 1);
        layer_f(d13_w2, d13_b2, h2, action, D13_H, D13_NU, 0);
    }
}

/* action -> servo targets (radians), replicating the sim's actuation layer.
 * tgt must persist between calls (init to d13_q_stand). */
void d13_firmware_step(const float *action, float *tgt) {
    for (int j = 0; j < D13_NU; j++) {
        float a = action[j] < -1.f ? -1.f : (action[j] > 1.f ? 1.f : action[j]);
        float raw = d13_q_stand[j] + a * D13_ACT_SCALE;
        if (raw < d13_q_lo[j]) raw = d13_q_lo[j];
        if (raw > d13_q_hi[j]) raw = d13_q_hi[j];
        float sm = D13_SMOOTH * tgt[j] + (1.f - D13_SMOOTH) * raw;
        float d = sm - tgt[j], lim = D13_SLEW * D13_DT;
        if (d > lim) d = lim;
        if (d < -lim) d = -lim;
        tgt[j] += d;
    }
}

int main(int argc, char **argv) {
    int q = argc > 1 && !strcmp(argv[1], "int8");
    char line[65536];
    float obs[D13_NOBS], act[D13_NU];
    while (fgets(line, sizeof line, stdin)) {
        char *p = line;
        for (int i = 0; i < D13_NOBS; i++) obs[i] = strtof(p, &p), p++;
        d13_policy(obs, act, q);
        for (int j = 0; j < D13_NU; j++) printf("%.8e%c", act[j], j + 1 < D13_NU ? ',' : '\n');
    }
    return 0;
}
