// GENERATED from dummy13_v3.xml by _export_scad.py — do not hand-edit.
// Units mm. Each module = one printed plate with computed holes.
// M2 pilot 1.7 | horn hub 4.8 + arms at +-7 | spline pass 5.5.

module ankleconn_l() {
  difference() {
    cube([8.00, 16.00, 2.00], center=true);
  }
}

module ankleconn_r() {
  difference() {
    cube([8.00, 16.00, 2.00], center=true);
  }
}

module ankledrive_l() {
  difference() {
    cube([2.00, 16.00, 42.00], center=true);
    translate([0.00,0.00,13.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,13.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,13.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module ankledrive_r() {
  difference() {
    cube([2.00, 16.00, 42.00], center=true);
    translate([0.00,0.00,13.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,13.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,13.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module apmnt_l_bar1() {
  difference() {
    cube([2.00, 12.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module apmnt_l_bar2() {
  difference() {
    cube([2.00, 12.00, 4.20], center=true);
    translate([-2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module apmnt_r_bar1() {
  difference() {
    cube([2.00, 12.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module apmnt_r_bar2() {
  difference() {
    cube([2.00, 12.00, 4.20], center=true);
    translate([2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module armnt_l_bar1() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module armnt_l_bar2() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module armnt_r_bar1() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module armnt_r_bar2() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module bar_b() {
  difference() {
    cube([57.80, 4.00, 8.00], center=true);
  }
}

module bar_f() {
  difference() {
    cube([57.80, 4.00, 8.00], center=true);
  }
}

module elmnt_l_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module elmnt_l_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module elmnt_r_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module elmnt_r_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module foothorn_l() {
  difference() {
    cube([8.00, 2.00, 7.80], center=true);
    translate([0.00,0.00,2.40]) rotate([90,0,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,2.40]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,2.40]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module foothorn_r() {
  difference() {
    cube([8.00, 2.00, 7.80], center=true);
    translate([0.00,0.00,2.40]) rotate([90,0,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,2.40]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,2.40]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module footstrut_l() {
  difference() {
    cube([16.00, 2.00, 15.60], center=true);
  }
}

module footstrut_r() {
  difference() {
    cube([16.00, 2.00, 15.60], center=true);
  }
}

module foredrive_l() {
  difference() {
    cube([2.00, 12.00, 28.00], center=true);
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module foredrive_r() {
  difference() {
    cube([2.00, 12.00, 28.00], center=true);
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module hipU_l_0() {
  difference() {
    cube([2.00, 16.00, 32.20], center=true);
  }
}

module hipU_l_1() {
  difference() {
    cube([2.00, 16.00, 32.20], center=true);
  }
}

module hipU_r_0() {
  difference() {
    cube([2.00, 16.00, 32.20], center=true);
  }
}

module hipU_r_1() {
  difference() {
    cube([2.00, 16.00, 32.20], center=true);
  }
}

module hipconn_l() {
  difference() {
    cube([2.00, 16.00, 2.80], center=true);
  }
}

module hipconn_r() {
  difference() {
    cube([2.00, 16.00, 2.80], center=true);
  }
}

module hpmnt_l_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module hpmnt_l_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module hpmnt_r_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module hpmnt_r_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module keel() {
  difference() {
    cube([10.00, 10.00, 40.00], center=true);
  }
}

module knmnt_l_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module knmnt_l_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module knmnt_r_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module knmnt_r_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module rail_l() {
  difference() {
    cube([4.40, 32.00, 8.00], center=true);
  }
}

module rail_r() {
  difference() {
    cube([4.40, 32.00, 8.00], center=true);
  }
}

module rollhorn_l() {
  difference() {
    cube([16.00, 2.00, 24.00], center=true);
    translate([0.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module rollhorn_r() {
  difference() {
    cube([16.00, 2.00, 24.00], center=true);
    translate([0.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module rollhornp_l() {
  difference() {
    cube([18.00, 2.00, 18.00], center=true);
    translate([0.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module rollhornp_r() {
  difference() {
    cube([18.00, 2.00, 18.00], center=true);
    translate([0.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module rollmnt_l_bar1() {
  difference() {
    cube([14.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module rollmnt_l_bar2() {
  difference() {
    cube([14.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module rollmnt_r_bar1() {
  difference() {
    cube([14.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module rollmnt_r_bar2() {
  difference() {
    cube([14.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shdrive_l() {
  difference() {
    cube([2.00, 14.00, 24.00], center=true);
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module shdrive_r() {
  difference() {
    cube([2.00, 14.00, 24.00], center=true);
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module shell_back() {
  difference() {
    cube([40.00, 2.60, 64.00], center=true);
  }
}

module shell_front() {
  difference() {
    cube([40.00, 2.60, 64.00], center=true);
  }
}

module shell_top() {
  difference() {
    cube([40.00, 22.60, 2.00], center=true);
  }
}

module shindrive_l() {
  difference() {
    cube([2.00, 16.00, 76.00], center=true);
    translate([0.00,0.00,26.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,26.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,26.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,0.00,-26.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module shindrive_r() {
  difference() {
    cube([2.00, 16.00, 76.00], center=true);
    translate([0.00,0.00,26.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,26.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,26.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,0.00,-26.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module shinweb_l() {
  difference() {
    cube([16.00, 16.00, 2.00], center=true);
  }
}

module shinweb_r() {
  difference() {
    cube([16.00, 16.00, 2.00], center=true);
  }
}

module shmnt_l_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shmnt_l_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shmnt_r_bar1() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shmnt_r_bar2() {
  difference() {
    cube([2.00, 16.00, 4.20], center=true);
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shrollmnt_l_bar1() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.10]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shrollmnt_l_bar2() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shrollmnt_r_bar1() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.10]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module shrollmnt_r_bar2() {
  difference() {
    cube([16.00, 2.00, 4.20], center=true);
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module sole_l() {
  difference() {
    cube([28.00, 45.00, 3.00], center=true);
    translate([0.00,-22.00,4.40])  cylinder(h=5.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module sole_r() {
  difference() {
    cube([28.00, 45.00, 3.00], center=true);
    translate([0.00,-22.00,4.40])  cylinder(h=5.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module spinearm() {
  difference() {
    cube([13.80, 12.00, 2.00], center=true);
    translate([-5.10,0.00,0.00])  cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module spinedrive() {
  difference() {
    cube([2.00, 12.00, 8.00], center=true);
    translate([0.00,0.00,-2.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module spinedrop() {
  difference() {
    cube([2.00, 12.00, 16.60], center=true);
    translate([0.00,0.00,4.30]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
    translate([0.00,0.00,-0.70]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module spinemnt_bar1() {
  difference() {
    cube([2.00, 4.20, 16.00], center=true);
    translate([2.60,0.10,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module spinemnt_bar2() {
  difference() {
    cube([2.00, 4.20, 16.00], center=true);
    translate([2.60,-0.10,0.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

module thighdrive_l() {
  difference() {
    cube([2.00, 16.00, 82.00], center=true);
    translate([0.00,0.00,29.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,29.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,29.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,0.00,-29.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module thighdrive_r() {
  difference() {
    cube([2.00, 16.00, 82.00], center=true);
    translate([0.00,0.00,29.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,29.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,29.00]) rotate([0,90,0]) cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([0.00,0.00,-29.00]) rotate([0,90,0]) cylinder(h=4.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

module thighweb_l() {
  difference() {
    cube([16.00, 16.00, 2.00], center=true);
  }
}

module thighweb_r() {
  difference() {
    cube([16.00, 16.00, 2.00], center=true);
  }
}

module yawplate_l() {
  difference() {
    cube([14.00, 20.00, 2.00], center=true);
    translate([0.00,0.00,0.00])  cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00])  cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00])  cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

module yawplate_r() {
  difference() {
    cube([14.00, 20.00, 2.00], center=true);
    translate([0.00,0.00,0.00])  cylinder(h=4.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00])  cylinder(h=4.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00])  cylinder(h=4.0, r=0.85, center=true, $fn=16);
  }
}

// ---- print-bed layout: every part, spaced ----
PART = "all";
if (PART == "all") translate([0, 0, 0]) ankleconn_l();
if (PART == "ankleconn_l") ankleconn_l();
if (PART == "all") translate([45, 0, 0]) ankleconn_r();
if (PART == "ankleconn_r") ankleconn_r();
if (PART == "all") translate([90, 0, 0]) ankledrive_l();
if (PART == "ankledrive_l") ankledrive_l();
if (PART == "all") translate([135, 0, 0]) ankledrive_r();
if (PART == "ankledrive_r") ankledrive_r();
if (PART == "all") translate([180, 0, 0]) apmnt_l_bar1();
if (PART == "apmnt_l_bar1") apmnt_l_bar1();
if (PART == "all") translate([225, 0, 0]) apmnt_l_bar2();
if (PART == "apmnt_l_bar2") apmnt_l_bar2();
if (PART == "all") translate([0, 45, 0]) apmnt_r_bar1();
if (PART == "apmnt_r_bar1") apmnt_r_bar1();
if (PART == "all") translate([45, 45, 0]) apmnt_r_bar2();
if (PART == "apmnt_r_bar2") apmnt_r_bar2();
if (PART == "all") translate([90, 45, 0]) armnt_l_bar1();
if (PART == "armnt_l_bar1") armnt_l_bar1();
if (PART == "all") translate([135, 45, 0]) armnt_l_bar2();
if (PART == "armnt_l_bar2") armnt_l_bar2();
if (PART == "all") translate([180, 45, 0]) armnt_r_bar1();
if (PART == "armnt_r_bar1") armnt_r_bar1();
if (PART == "all") translate([225, 45, 0]) armnt_r_bar2();
if (PART == "armnt_r_bar2") armnt_r_bar2();
if (PART == "all") translate([0, 90, 0]) bar_b();
if (PART == "bar_b") bar_b();
if (PART == "all") translate([45, 90, 0]) bar_f();
if (PART == "bar_f") bar_f();
if (PART == "all") translate([90, 90, 0]) elmnt_l_bar1();
if (PART == "elmnt_l_bar1") elmnt_l_bar1();
if (PART == "all") translate([135, 90, 0]) elmnt_l_bar2();
if (PART == "elmnt_l_bar2") elmnt_l_bar2();
if (PART == "all") translate([180, 90, 0]) elmnt_r_bar1();
if (PART == "elmnt_r_bar1") elmnt_r_bar1();
if (PART == "all") translate([225, 90, 0]) elmnt_r_bar2();
if (PART == "elmnt_r_bar2") elmnt_r_bar2();
if (PART == "all") translate([0, 135, 0]) foothorn_l();
if (PART == "foothorn_l") foothorn_l();
if (PART == "all") translate([45, 135, 0]) foothorn_r();
if (PART == "foothorn_r") foothorn_r();
if (PART == "all") translate([90, 135, 0]) footstrut_l();
if (PART == "footstrut_l") footstrut_l();
if (PART == "all") translate([135, 135, 0]) footstrut_r();
if (PART == "footstrut_r") footstrut_r();
if (PART == "all") translate([180, 135, 0]) foredrive_l();
if (PART == "foredrive_l") foredrive_l();
if (PART == "all") translate([225, 135, 0]) foredrive_r();
if (PART == "foredrive_r") foredrive_r();
if (PART == "all") translate([0, 180, 0]) hipU_l_0();
if (PART == "hipU_l_0") hipU_l_0();
if (PART == "all") translate([45, 180, 0]) hipU_l_1();
if (PART == "hipU_l_1") hipU_l_1();
if (PART == "all") translate([90, 180, 0]) hipU_r_0();
if (PART == "hipU_r_0") hipU_r_0();
if (PART == "all") translate([135, 180, 0]) hipU_r_1();
if (PART == "hipU_r_1") hipU_r_1();
if (PART == "all") translate([180, 180, 0]) hipconn_l();
if (PART == "hipconn_l") hipconn_l();
if (PART == "all") translate([225, 180, 0]) hipconn_r();
if (PART == "hipconn_r") hipconn_r();
if (PART == "all") translate([0, 225, 0]) hpmnt_l_bar1();
if (PART == "hpmnt_l_bar1") hpmnt_l_bar1();
if (PART == "all") translate([45, 225, 0]) hpmnt_l_bar2();
if (PART == "hpmnt_l_bar2") hpmnt_l_bar2();
if (PART == "all") translate([90, 225, 0]) hpmnt_r_bar1();
if (PART == "hpmnt_r_bar1") hpmnt_r_bar1();
if (PART == "all") translate([135, 225, 0]) hpmnt_r_bar2();
if (PART == "hpmnt_r_bar2") hpmnt_r_bar2();
if (PART == "all") translate([180, 225, 0]) keel();
if (PART == "keel") keel();
if (PART == "all") translate([225, 225, 0]) knmnt_l_bar1();
if (PART == "knmnt_l_bar1") knmnt_l_bar1();
if (PART == "all") translate([0, 270, 0]) knmnt_l_bar2();
if (PART == "knmnt_l_bar2") knmnt_l_bar2();
if (PART == "all") translate([45, 270, 0]) knmnt_r_bar1();
if (PART == "knmnt_r_bar1") knmnt_r_bar1();
if (PART == "all") translate([90, 270, 0]) knmnt_r_bar2();
if (PART == "knmnt_r_bar2") knmnt_r_bar2();
if (PART == "all") translate([135, 270, 0]) rail_l();
if (PART == "rail_l") rail_l();
if (PART == "all") translate([180, 270, 0]) rail_r();
if (PART == "rail_r") rail_r();
if (PART == "all") translate([225, 270, 0]) rollhorn_l();
if (PART == "rollhorn_l") rollhorn_l();
if (PART == "all") translate([0, 315, 0]) rollhorn_r();
if (PART == "rollhorn_r") rollhorn_r();
if (PART == "all") translate([45, 315, 0]) rollhornp_l();
if (PART == "rollhornp_l") rollhornp_l();
if (PART == "all") translate([90, 315, 0]) rollhornp_r();
if (PART == "rollhornp_r") rollhornp_r();
if (PART == "all") translate([135, 315, 0]) rollmnt_l_bar1();
if (PART == "rollmnt_l_bar1") rollmnt_l_bar1();
if (PART == "all") translate([180, 315, 0]) rollmnt_l_bar2();
if (PART == "rollmnt_l_bar2") rollmnt_l_bar2();
if (PART == "all") translate([225, 315, 0]) rollmnt_r_bar1();
if (PART == "rollmnt_r_bar1") rollmnt_r_bar1();
if (PART == "all") translate([0, 360, 0]) rollmnt_r_bar2();
if (PART == "rollmnt_r_bar2") rollmnt_r_bar2();
if (PART == "all") translate([45, 360, 0]) shdrive_l();
if (PART == "shdrive_l") shdrive_l();
if (PART == "all") translate([90, 360, 0]) shdrive_r();
if (PART == "shdrive_r") shdrive_r();
if (PART == "all") translate([135, 360, 0]) shell_back();
if (PART == "shell_back") shell_back();
if (PART == "all") translate([180, 360, 0]) shell_front();
if (PART == "shell_front") shell_front();
if (PART == "all") translate([225, 360, 0]) shell_top();
if (PART == "shell_top") shell_top();
if (PART == "all") translate([0, 405, 0]) shindrive_l();
if (PART == "shindrive_l") shindrive_l();
if (PART == "all") translate([45, 405, 0]) shindrive_r();
if (PART == "shindrive_r") shindrive_r();
if (PART == "all") translate([90, 405, 0]) shinweb_l();
if (PART == "shinweb_l") shinweb_l();
if (PART == "all") translate([135, 405, 0]) shinweb_r();
if (PART == "shinweb_r") shinweb_r();
if (PART == "all") translate([180, 405, 0]) shmnt_l_bar1();
if (PART == "shmnt_l_bar1") shmnt_l_bar1();
if (PART == "all") translate([225, 405, 0]) shmnt_l_bar2();
if (PART == "shmnt_l_bar2") shmnt_l_bar2();
if (PART == "all") translate([0, 450, 0]) shmnt_r_bar1();
if (PART == "shmnt_r_bar1") shmnt_r_bar1();
if (PART == "all") translate([45, 450, 0]) shmnt_r_bar2();
if (PART == "shmnt_r_bar2") shmnt_r_bar2();
if (PART == "all") translate([90, 450, 0]) shrollmnt_l_bar1();
if (PART == "shrollmnt_l_bar1") shrollmnt_l_bar1();
if (PART == "all") translate([135, 450, 0]) shrollmnt_l_bar2();
if (PART == "shrollmnt_l_bar2") shrollmnt_l_bar2();
if (PART == "all") translate([180, 450, 0]) shrollmnt_r_bar1();
if (PART == "shrollmnt_r_bar1") shrollmnt_r_bar1();
if (PART == "all") translate([225, 450, 0]) shrollmnt_r_bar2();
if (PART == "shrollmnt_r_bar2") shrollmnt_r_bar2();
if (PART == "all") translate([0, 495, 0]) sole_l();
if (PART == "sole_l") sole_l();
if (PART == "all") translate([45, 495, 0]) sole_r();
if (PART == "sole_r") sole_r();
if (PART == "all") translate([90, 495, 0]) spinearm();
if (PART == "spinearm") spinearm();
if (PART == "all") translate([135, 495, 0]) spinedrive();
if (PART == "spinedrive") spinedrive();
if (PART == "all") translate([180, 495, 0]) spinedrop();
if (PART == "spinedrop") spinedrop();
if (PART == "all") translate([225, 495, 0]) spinemnt_bar1();
if (PART == "spinemnt_bar1") spinemnt_bar1();
if (PART == "all") translate([0, 540, 0]) spinemnt_bar2();
if (PART == "spinemnt_bar2") spinemnt_bar2();
if (PART == "all") translate([45, 540, 0]) thighdrive_l();
if (PART == "thighdrive_l") thighdrive_l();
if (PART == "all") translate([90, 540, 0]) thighdrive_r();
if (PART == "thighdrive_r") thighdrive_r();
if (PART == "all") translate([135, 540, 0]) thighweb_l();
if (PART == "thighweb_l") thighweb_l();
if (PART == "all") translate([180, 540, 0]) thighweb_r();
if (PART == "thighweb_r") thighweb_r();
if (PART == "all") translate([225, 540, 0]) yawplate_l();
if (PART == "yawplate_l") yawplate_l();
if (PART == "all") translate([0, 585, 0]) yawplate_r();
if (PART == "yawplate_r") yawplate_r();