/* SUPERSEDED: hole positions here were hand-typed. Use dummy13_v3_generated.scad,
   whose plates + holes are COMPUTED from the audited simulation model. */
/* DUMMY 13 V3 — every printed part, parametric, with screw holes.
 *
 * These dimensions are THE SAME CONSTANTS as mujoco/_make_v3.py (the audited simulation
 * model): if you change one, change both. Units: mm.
 *
 * Render:  open in OpenSCAD (or openscad-web) -> F6 -> export STL.
 *   PART="all"    a print-bed layout of every part (default)
 *   PART="rail"   one specific part (see the list at the bottom)
 * Material: PETG, 2 mm walls, 40% infill, no supports needed for any part.
 * Screws:  M2 x 8 self-tapping for every plate-to-servo-tab joint (the holes here are
 *          1.7 mm: self-tappers bite PETG well). Horn screws come with the servos.
 */

PART = "all";

/* ---- the servo (MG90S / SG90 share a case) ---- */
SV_L = 22.8;   // case length
SV_W = 12.2;   // case width
SV_H = 22.5;   // case height (shaft axis along this)
TAB_L = 32.5;  // length across the mounting tabs
TAB_HOLE = 27.8;   // hole-to-hole across the tabs
PL = 2.0;      // plate thickness
M2 = 1.7;      // self-tap pilot
HORN_HUB = 4.8;    // horn hub clearance hole

module m2(x, y) { translate([x, y, -1]) cylinder(h = PL + 2, r = M2 / 2, $fn = 16); }
module hub(x, y) { translate([x, y, -1]) cylinder(h = PL + 2, r = HORN_HUB / 2, $fn = 24); }

/* horn screw pattern: hub + 2 arm screws at +-7 mm (fits the stock 4-arm micro horn) */
module horn_holes(x, y, rot = 0) {
    translate([x, y, 0]) rotate([0, 0, rot]) {
        translate([0, 0, -1]) cylinder(h = PL + 2, r = HORN_HUB / 2, $fn = 24);
        for (s = [-7, 7]) translate([s, 0, -1]) cylinder(h = PL + 2, r = M2 / 2, $fn = 16);
    }
}
/* servo-tab screw pattern (screws into the case tabs across TAB_HOLE) */
module tab_holes(x, y, rot = 0) {
    translate([x, y, 0]) rotate([0, 0, rot])
        for (s = [-TAB_HOLE / 2, TAB_HOLE / 2]) translate([s, 0, -1])
            cylinder(h = PL + 2, r = M2 / 2, $fn = 16);
}

/* ---------------- pelvis ---------------- */
module rail() {                          // x2 — pelvis side rails
    difference() {
        cube([6, 32, 8]);
        m2(3, 4);  m2(3, 28);            // crossbar screws
    }
}
module crossbar() {                      // x2 — pelvis front/back bars
    difference() {
        cube([48, 4, 6]);
        m2(3, 2);  m2(45, 2);            // into the rails
        m2(13, 2); m2(35, 2);            // yaw-servo tab screws (front tab each side)
    }
}
module yaw_horn_plate() {                // x2 — hip: yaw horn -> U-plates
    difference() {
        cube([14, 20, PL]);
        horn_holes(7, 10);
        m2(2, 3);  m2(2, 17);            // U-plate screws (left edge)
        m2(12, 3); m2(12, 17);           // U-plate screws (right edge)
    }
}
module hip_u_plate() {                   // x4 (2 per leg) — yaw plate down around roll servo
    difference() {
        cube([19, 16, PL]);
        m2(2.5, 4);  m2(2.5, 12);        // to the yaw horn plate
        m2(16.5, 4); m2(16.5, 12);       // to the roll-servo tabs
    }
}
module roll_horn_L() {                   // x2 per side kind (4 total: hip L/R mirrored ok)
    // one printed L: vertical face (to the pitch-servo case side) + top flange (to the
    // roll horn). This replaces the plate that used to pass THROUGH the pitch case.
    difference() {
        union() {
            cube([20, PL, 27]);                       // vertical
            translate([0, 0, 25]) cube([20, 8, PL]);  // flange
        }
        translate([0, 0, 0]) rotate([90, 0, 0]) translate([0, 0, -PL - 1]) {
            translate([4, 8, 0])  cylinder(h = PL + 2, r = M2 / 2, $fn = 16);
            translate([16, 8, 0]) cylinder(h = PL + 2, r = M2 / 2, $fn = 16);
            translate([4, 20, 0])  cylinder(h = PL + 2, r = M2 / 2, $fn = 16);
            translate([16, 20, 0]) cylinder(h = PL + 2, r = M2 / 2, $fn = 16);
        }
        translate([10, 4, 25]) union() {              // horn on the flange
            translate([0, 0, -1]) cylinder(h = PL + 2, r = HORN_HUB / 2, $fn = 24);
        }
    }
}

/* ---------------- limbs ---------------- */
module limb_plate() {                    // x8 — thigh/shin side plates (58 mm joints-to-joint)
    difference() {
        cube([58, 16, PL]);
        horn_holes(5.5, 8, 90);          // drive end (servo horn)
        m2(47, 3); m2(53, 8); m2(47, 13);// case end (screws into servo tab + case boss)
    }
}
module ankle_plate() {                   // x2 — shin bottom -> ankle-roll servo, outboard
    difference() {
        cube([22, 16, PL]);
        horn_holes(5.5, 8, 90);          // ankle-pitch horn
        m2(17, 4); m2(17, 12);           // roll-servo tab
    }
}
module foot_horn_plate() {               // x2 — ankle-roll horn -> sole
    difference() {
        cube([16, 21, PL]);
        horn_holes(8, 6);
        m2(3, 18); m2(13, 18);           // into the sole bosses
    }
}
module sole() {                          // x2 — 28 x 45 x 3 with bosses for the horn plate
    difference() {
        union() {
            cube([28, 45, 3]);
            translate([6, 18, 3]) cube([4, 6, 4]);    // bosses
            translate([18, 18, 3]) cube([4, 6, 4]);
        }
        m2(8, 21); m2(20, 21);
    }
}

/* ---------------- torso & head ---------------- */
module chest_shell() {                   // x2 — front/back plates 40 x 64
    difference() {
        cube([40, 64, 2.5]);
        m2(3, 3);  m2(37, 3); m2(3, 61); m2(37, 61);
        // front plate: cut the speaker grille yourself or print the variant below
    }
}
module chest_shell_front() {             // x1 — with speaker grille + camera slot
    difference() {
        chest_shell();
        translate([20, 30, -1]) cylinder(h = 5, r = 11, $fn = 36);   // speaker grille
    }
}
module chest_top() { difference() { cube([40, 22.6, PL]); m2(3, 3); m2(37, 3); m2(3, 19.6); m2(37, 19.6); } }
module head_housing() {                  // x1 — the XIAO IS the head: hollow box,
    difference() {                       // camera square in the face, board slot inside
        cube([24, 18, 20]);
        translate([2, 2, 2]) cube([20, 14, 20]);      // cavity (open top -> lid)
        translate([12 - 4.5, -1, 10 - 4.5]) cube([9, 4, 9]);   // camera window (face)
        translate([12, 19, 10]) rotate([90, 0, 0]) cylinder(h = 4, r = 1.5, $fn = 16); // usb-c back
    }
}
module head_lid() { difference() { cube([24, 18, PL]); m2(3, 3); m2(21, 15); } }
module neck_post() { cube([12, 12, 2]); }

/* ---------------- layout ---------------- */
module all() {
    rail(); translate([10, 0, 0]) rail();
    translate([0, 36, 0]) crossbar(); translate([0, 44, 0]) crossbar();
    translate([22, 0, 0]) yaw_horn_plate(); translate([40, 0, 0]) yaw_horn_plate();
    for (i = [0:3]) translate([58 + i * 23, 0, 0]) hip_u_plate();
    for (i = [0:3]) translate([0, 52 + i * 20, 0]) limb_plate();
    for (i = [0:3]) translate([62, 52 + i * 20, 0]) limb_plate();
    translate([124, 36, 0]) roll_horn_L(); translate([150, 36, 0]) roll_horn_L();
    translate([124, 0, 0]) ankle_plate(); translate([124, 20, 0]) ankle_plate();
    translate([0, 136, 0]) chest_shell_front(); translate([44, 136, 0]) chest_shell();
    translate([88, 136, 0]) chest_top();
    translate([88, 162, 0]) head_housing(); translate([116, 162, 0]) head_lid();
    translate([116, 184, 0]) neck_post();
    translate([124, 52, 0]) sole(); translate([156, 52, 0]) sole();
    translate([124, 100, 0]) foot_horn_plate(); translate([144, 100, 0]) foot_horn_plate();
}

if (PART == "all") all();
else if (PART == "rail") rail();
else if (PART == "crossbar") crossbar();
else if (PART == "yaw_horn_plate") yaw_horn_plate();
else if (PART == "hip_u_plate") hip_u_plate();
else if (PART == "roll_horn_L") roll_horn_L();
else if (PART == "limb_plate") limb_plate();
else if (PART == "ankle_plate") ankle_plate();
else if (PART == "foot_horn_plate") foot_horn_plate();
else if (PART == "sole") sole();
else if (PART == "chest_shell") chest_shell();
else if (PART == "chest_shell_front") chest_shell_front();
else if (PART == "chest_top") chest_top();
else if (PART == "head_housing") head_housing();
else if (PART == "head_lid") head_lid();
else if (PART == "neck_post") neck_post();
