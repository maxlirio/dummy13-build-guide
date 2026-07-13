/* Camera->rays CNN inference. cc -O2 cam_infer.c -lm -o camtest
 * stdin: 64*64*3 floats (CHW, [0,1]) per line-separated frame; stdout: 9 rays. */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "cam_student.h"

static void conv2d(const float *x, float *y, const float *w, const float *b,
                   int ci, int co, int n, int k, int s, int p) {
    int no = n / s;
    for (int o = 0; o < co; o++)
        for (int i2 = 0; i2 < no; i2++)
            for (int j2 = 0; j2 < no; j2++) {
                float acc = b[o];
                for (int c = 0; c < ci; c++)
                    for (int u = 0; u < k; u++)
                        for (int v = 0; v < k; v++) {
                            int r = i2 * s + u - p, q = j2 * s + v - p;
                            if (r < 0 || r >= n || q < 0 || q >= n) continue;
                            acc += w[((o * ci + c) * k + u) * k + v] * x[(c * n + r) * n + q];
                        }
                y[(o * no + i2) * no + j2] = acc > 0.f ? acc : 0.f;   /* ReLU */
            }
}

void cam_infer(const float *img, float *rays) {
    static float a[16*(CAM_RES/2)*(CAM_RES/2)], b2[32*(CAM_RES/4)*(CAM_RES/4)], c[32*(CAM_RES/8)*(CAM_RES/8)], col[32*(CAM_RES/8)], hbuf[64];
    conv2d(img, a, cam_w0, cam_b0, 3, 16, CAM_RES, 5, 2, 2);
    conv2d(a, b2, cam_w1, cam_b1, 16, 32, CAM_RES/2, 3, 2, 1);
    conv2d(b2, c, cam_w2, cam_b2, 32, 32, CAM_RES/4, 3, 2, 1);
    const int G = CAM_RES / 8;
    for (int ch = 0; ch < 32; ch++)
        for (int j = 0; j < G; j++) {
            float s = 0.f;
            for (int i = 0; i < G; i++) s += c[(ch * G + i) * G + j];
            col[ch * G + j] = s / (float)G;
        }
    for (int o = 0; o < 64; o++) {
        float s = cam_fb0[o];
        for (int i = 0; i < 32 * G; i++) s += cam_fw0[o * (32 * G) + i] * col[i];
        hbuf[o] = s > 0.f ? s : 0.f;
    }
    for (int o = 0; o < 9; o++) {
        float s = cam_fb1[o];
        for (int i = 0; i < 64; i++) s += cam_fw1[o * 64 + i] * hbuf[i];
        rays[o] = 1.f / (1.f + expf(-s));
    }
}

int main(void) {
    static float img[3 * CAM_RES * CAM_RES];
    float rays[9];
    for (;;) {
        for (int i = 0; i < 3 * CAM_RES * CAM_RES; i++)
            if (scanf("%f", &img[i]) != 1) return 0;
        cam_infer(img, rays);
        for (int j = 0; j < 9; j++) printf("%.8e%c", rays[j], j < 8 ? ',' : '\n');
        fflush(stdout);
    }
}
