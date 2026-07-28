// GENERATED from dummy13_v3.xml by _export_scad.py — do not hand-edit.
// Units mm. Each module = ONE PRINTED PART (touching same-body plates fused).
// M2 pilot 1.7 | horn hub 4.8 + arms at +-7 | spline pass 5.5.

// part 'ankledrive_l_part' = ankleconn_l + ankledrive_l
module ankledrive_l_part() {
  difference() {
    union() {
      translate([-2.50,0.00,3.50]) cube([2.00, 16.00, 42.00], center=true);
      translate([2.50,0.00,-3.50]) cube([8.00, 16.00, 2.00], center=true);
    }
    translate([-2.50,0.00,16.50]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([-2.50,7.00,16.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-2.50,-7.00,16.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'ankledrive_r_part' = ankleconn_r + ankledrive_r
module ankledrive_r_part() {
  difference() {
    union() {
      translate([2.50,0.00,3.50]) cube([2.00, 16.00, 42.00], center=true);
      translate([-2.50,0.00,-3.50]) cube([8.00, 16.00, 2.00], center=true);
    }
    translate([2.50,0.00,16.50]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([2.50,7.00,16.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([2.50,-7.00,16.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'apmnt_l_bar1' = apmnt_l_bar1
module apmnt_l_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 12.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'apmnt_l_bar2' = apmnt_l_bar2
module apmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 12.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'apmnt_r_bar1' = apmnt_r_bar1
module apmnt_r_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 12.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'apmnt_r_bar2' = apmnt_r_bar2
module apmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 12.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'armnt_l_bar1' = armnt_l_bar1
module armnt_l_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'armnt_l_bar2' = armnt_l_bar2
module armnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'armnt_r_bar1' = armnt_r_bar1
module armnt_r_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'armnt_r_bar2' = armnt_r_bar2
module armnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'elmnt_l_bar1' = elmnt_l_bar1
module elmnt_l_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'elmnt_l_bar2' = elmnt_l_bar2
module elmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'elmnt_r_bar1' = elmnt_r_bar1
module elmnt_r_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'elmnt_r_bar2' = elmnt_r_bar2
module elmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'foredrive_l' = foredrive_l
module foredrive_l() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 12.00, 28.00], center=true);
    }
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'foredrive_r' = foredrive_r
module foredrive_r() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 12.00, 28.00], center=true);
    }
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'hipU_l_0_part' = hipU_l_0 + hipU_l_1 + rollmnt_l_bar1 + yawplate_l
module hipU_l_0_part() {
  difference() {
    union() {
      translate([0.00,7.40,11.30]) cube([16.00, 20.00, 2.00], center=true);
      translate([0.00,-6.20,0.30]) cube([16.00, 2.00, 4.20], center=true);
      translate([-8.20,-0.60,-5.80]) cube([2.00, 16.00, 32.20], center=true);
      translate([8.20,-0.60,-5.80]) cube([2.00, 16.00, 32.20], center=true);
    }
    translate([0.00,7.40,11.30])  cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,7.40,11.30])  cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-7.00,7.40,11.30])  cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-3.60,0.30]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'hipU_r_0_part' = hipU_r_0 + hipU_r_1 + rollmnt_r_bar1 + yawplate_r
module hipU_r_0_part() {
  difference() {
    union() {
      translate([0.00,7.40,11.30]) cube([16.00, 20.00, 2.00], center=true);
      translate([0.00,-6.20,0.30]) cube([16.00, 2.00, 4.20], center=true);
      translate([-8.20,-0.60,-5.80]) cube([2.00, 16.00, 32.20], center=true);
      translate([8.20,-0.60,-5.80]) cube([2.00, 16.00, 32.20], center=true);
    }
    translate([0.00,7.40,11.30])  cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,7.40,11.30])  cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-7.00,7.40,11.30])  cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-3.60,0.30]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'hipconn_l_part' = hipconn_l + hpmnt_l_bar1 + rollhornp_l
module hipconn_l_part() {
  difference() {
    union() {
      translate([-2.40,3.13,8.03]) cube([18.00, 2.00, 18.00], center=true);
      translate([1.20,-1.57,-5.77]) cube([2.00, 16.00, 4.20], center=true);
      translate([1.20,-1.57,-2.27]) cube([2.00, 16.00, 2.80], center=true);
    }
    translate([-2.40,3.13,8.03]) rotate([90,0,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([4.60,3.13,8.03]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-9.40,3.13,8.03]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-1.40,-1.57,-5.77]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'hipconn_r_part' = hipconn_r + hpmnt_r_bar1 + rollhornp_r
module hipconn_r_part() {
  difference() {
    union() {
      translate([2.40,3.13,8.03]) cube([18.00, 2.00, 18.00], center=true);
      translate([-1.20,-1.57,-5.77]) cube([2.00, 16.00, 4.20], center=true);
      translate([-1.20,-1.57,-2.27]) cube([2.00, 16.00, 2.80], center=true);
    }
    translate([2.40,3.13,8.03]) rotate([90,0,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([9.40,3.13,8.03]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-4.60,3.13,8.03]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([1.40,-1.57,-5.77]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'hpmnt_l_bar2' = hpmnt_l_bar2
module hpmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'hpmnt_r_bar2' = hpmnt_r_bar2
module hpmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'keel_part' = keel + shell_back + shell_top + spinemnt_bar1
module keel_part() {
  difference() {
    union() {
      translate([1.80,1.38,-36.75]) cube([2.00, 6.10, 16.00], center=true);
      translate([-0.60,-2.18,-0.75]) cube([40.00, 2.60, 64.00], center=true);
      translate([-0.60,10.12,28.85]) cube([40.00, 23.60, 4.80], center=true);
      translate([-0.60,-9.23,7.25]) cube([10.00, 13.10, 40.00], center=true);
    }
    translate([4.40,2.42,-36.75]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'knmnt_l_bar1' = knmnt_l_bar1
module knmnt_l_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'knmnt_l_bar2' = knmnt_l_bar2
module knmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'knmnt_r_bar1' = knmnt_r_bar1
module knmnt_r_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'knmnt_r_bar2' = knmnt_r_bar2
module knmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'rollhorn_l' = rollhorn_l
module rollhorn_l() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 24.00], center=true);
    }
    translate([0.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'rollhorn_r' = rollhorn_r
module rollhorn_r() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 24.00], center=true);
    }
    translate([0.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-7.00,0.00,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'rollmnt_l_bar2' = rollmnt_l_bar2
module rollmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([14.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'rollmnt_r_bar2' = rollmnt_r_bar2
module rollmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([14.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shdrive_l' = shdrive_l
module shdrive_l() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 14.00, 24.00], center=true);
    }
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'shdrive_r' = shdrive_r
module shdrive_r() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 14.00, 24.00], center=true);
    }
    translate([0.00,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([0.00,7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-7.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
  }
}

// part 'shell_front_part' = shell_front + spinemnt_bar2
module shell_front_part() {
  difference() {
    union() {
      translate([1.20,-1.70,-18.00]) cube([2.00, 4.20, 16.00], center=true);
      translate([-1.20,1.70,18.00]) cube([40.00, 2.60, 64.00], center=true);
    }
    translate([3.80,-1.80,-18.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shindrive_l_part' = shindrive_l + shinweb_l
module shindrive_l_part() {
  difference() {
    union() {
      translate([4.50,0.00,5.00]) cube([2.00, 16.00, 76.00], center=true);
      translate([-4.10,0.00,-5.00]) cube([16.80, 16.00, 2.00], center=true);
    }
    translate([4.50,0.00,31.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([4.50,7.00,31.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([4.50,-7.00,31.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([4.50,0.00,-21.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

// part 'shindrive_r_part' = shindrive_r + shinweb_r
module shindrive_r_part() {
  difference() {
    union() {
      translate([-4.50,0.00,5.00]) cube([2.00, 16.00, 76.00], center=true);
      translate([4.10,0.00,-5.00]) cube([16.80, 16.00, 2.00], center=true);
    }
    translate([-4.50,0.00,31.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([-4.50,7.00,31.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-4.50,-7.00,31.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-4.50,0.00,-21.00]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

// part 'shmnt_l_bar1' = shmnt_l_bar1
module shmnt_l_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shmnt_l_bar2' = shmnt_l_bar2
module shmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([-2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shmnt_r_bar1' = shmnt_r_bar1
module shmnt_r_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.10]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shmnt_r_bar2' = shmnt_r_bar2
module shmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([2.00, 16.00, 4.20], center=true);
    }
    translate([2.60,0.00,0.00]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shrollmnt_l_bar1' = shrollmnt_l_bar1
module shrollmnt_l_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.10]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shrollmnt_l_bar2' = shrollmnt_l_bar2
module shrollmnt_l_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shrollmnt_r_bar1' = shrollmnt_r_bar1
module shrollmnt_r_bar1() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.10]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'shrollmnt_r_bar2' = shrollmnt_r_bar2
module shrollmnt_r_bar2() {
  difference() {
    union() {
      translate([0.00,0.00,0.00]) cube([16.00, 2.00, 4.20], center=true);
    }
    translate([0.00,2.60,0.00]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'sole_l_part' = foothorn_l + footstrut_l + sole_l
module sole_l_part() {
  difference() {
    union() {
      translate([0.00,-2.77,10.85]) cube([8.00, 2.00, 8.70], center=true);
      translate([0.00,-0.77,-1.40]) cube([16.00, 2.00, 17.40], center=true);
      translate([0.00,3.53,-10.80]) cube([28.00, 45.00, 3.00], center=true);
    }
    translate([0.00,-2.77,13.70]) rotate([90,0,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,-2.77,13.70]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-7.00,-2.77,13.70]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-18.47,-6.40])  cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'sole_r_part' = foothorn_r + footstrut_r + sole_r
module sole_r_part() {
  difference() {
    union() {
      translate([0.00,-2.77,10.85]) cube([8.00, 2.00, 8.70], center=true);
      translate([0.00,-0.77,-1.40]) cube([16.00, 2.00, 17.40], center=true);
      translate([0.00,3.53,-10.80]) cube([28.00, 45.00, 3.00], center=true);
    }
    translate([0.00,-2.77,13.70]) rotate([90,0,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([7.00,-2.77,13.70]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-7.00,-2.77,13.70]) rotate([90,0,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([0.00,-18.47,-6.40])  cylinder(h=60.0, r=0.85, center=true, $fn=16); // M2 into flange
  }
}

// part 'spinedrive_part' = bar_b + bar_f + rail_l + rail_r + spinearm + spinedrive + spinedrop
module spinedrive_part() {
  difference() {
    union() {
      translate([-41.79,-2.57,-7.50]) cube([5.30, 32.00, 8.00], center=true);
      translate([19.71,-2.57,-7.50]) cube([5.30, 32.00, 8.00], center=true);
      translate([-11.04,-16.67,-7.50]) cube([57.80, 4.00, 8.00], center=true);
      translate([-11.04,11.53,-7.50]) cube([57.80, 4.00, 8.00], center=true);
      translate([8.16,3.43,11.10]) cube([2.00, 12.00, 8.00], center=true);
      translate([16.06,3.43,14.10]) cube([13.80, 12.00, 2.00], center=true);
      translate([19.01,3.43,4.40]) cube([3.90, 12.00, 17.40], center=true);
    }
    translate([8.16,3.43,9.10]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
    translate([10.96,3.43,14.10])  cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
    translate([19.96,3.43,9.10]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
    translate([19.96,3.43,4.10]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

// part 'thighdrive_l_part' = thighdrive_l + thighweb_l
module thighdrive_l_part() {
  difference() {
    union() {
      translate([4.50,0.00,3.50]) cube([2.00, 16.00, 82.00], center=true);
      translate([-4.50,0.00,-3.50]) cube([16.00, 16.00, 2.00], center=true);
    }
    translate([4.50,0.00,32.50]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([4.50,7.00,32.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([4.50,-7.00,32.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([4.50,0.00,-25.50]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

// part 'thighdrive_r_part' = thighdrive_r + thighweb_r
module thighdrive_r_part() {
  difference() {
    union() {
      translate([-4.50,0.00,3.50]) cube([2.00, 16.00, 82.00], center=true);
      translate([4.50,0.00,-3.50]) cube([16.00, 16.00, 2.00], center=true);
    }
    translate([-4.50,0.00,32.50]) rotate([0,90,0]) cylinder(h=60.0, r=2.4, center=true, $fn=24); // horn hub
    translate([-4.50,7.00,32.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-4.50,-7.00,32.50]) rotate([0,90,0]) cylinder(h=60.0, r=0.85, center=true, $fn=16);
    translate([-4.50,0.00,-25.50]) rotate([0,90,0]) cylinder(h=60.0, r=2.75, center=true, $fn=24); // spline pass
  }
}

// ---- print-bed layout ----
PART = "all";
if (PART == "all") translate([0, 0, 0]) ankledrive_l_part();
if (PART == "ankledrive_l_part") ankledrive_l_part();
if (PART == "all") translate([60, 0, 0]) ankledrive_r_part();
if (PART == "ankledrive_r_part") ankledrive_r_part();
if (PART == "all") translate([120, 0, 0]) apmnt_l_bar1();
if (PART == "apmnt_l_bar1") apmnt_l_bar1();
if (PART == "all") translate([180, 0, 0]) apmnt_l_bar2();
if (PART == "apmnt_l_bar2") apmnt_l_bar2();
if (PART == "all") translate([240, 0, 0]) apmnt_r_bar1();
if (PART == "apmnt_r_bar1") apmnt_r_bar1();
if (PART == "all") translate([0, 60, 0]) apmnt_r_bar2();
if (PART == "apmnt_r_bar2") apmnt_r_bar2();
if (PART == "all") translate([60, 60, 0]) armnt_l_bar1();
if (PART == "armnt_l_bar1") armnt_l_bar1();
if (PART == "all") translate([120, 60, 0]) armnt_l_bar2();
if (PART == "armnt_l_bar2") armnt_l_bar2();
if (PART == "all") translate([180, 60, 0]) armnt_r_bar1();
if (PART == "armnt_r_bar1") armnt_r_bar1();
if (PART == "all") translate([240, 60, 0]) armnt_r_bar2();
if (PART == "armnt_r_bar2") armnt_r_bar2();
if (PART == "all") translate([0, 120, 0]) elmnt_l_bar1();
if (PART == "elmnt_l_bar1") elmnt_l_bar1();
if (PART == "all") translate([60, 120, 0]) elmnt_l_bar2();
if (PART == "elmnt_l_bar2") elmnt_l_bar2();
if (PART == "all") translate([120, 120, 0]) elmnt_r_bar1();
if (PART == "elmnt_r_bar1") elmnt_r_bar1();
if (PART == "all") translate([180, 120, 0]) elmnt_r_bar2();
if (PART == "elmnt_r_bar2") elmnt_r_bar2();
if (PART == "all") translate([240, 120, 0]) foredrive_l();
if (PART == "foredrive_l") foredrive_l();
if (PART == "all") translate([0, 180, 0]) foredrive_r();
if (PART == "foredrive_r") foredrive_r();
if (PART == "all") translate([60, 180, 0]) hipU_l_0_part();
if (PART == "hipU_l_0_part") hipU_l_0_part();
if (PART == "all") translate([120, 180, 0]) hipU_r_0_part();
if (PART == "hipU_r_0_part") hipU_r_0_part();
if (PART == "all") translate([180, 180, 0]) hipconn_l_part();
if (PART == "hipconn_l_part") hipconn_l_part();
if (PART == "all") translate([240, 180, 0]) hipconn_r_part();
if (PART == "hipconn_r_part") hipconn_r_part();
if (PART == "all") translate([0, 240, 0]) hpmnt_l_bar2();
if (PART == "hpmnt_l_bar2") hpmnt_l_bar2();
if (PART == "all") translate([60, 240, 0]) hpmnt_r_bar2();
if (PART == "hpmnt_r_bar2") hpmnt_r_bar2();
if (PART == "all") translate([120, 240, 0]) keel_part();
if (PART == "keel_part") keel_part();
if (PART == "all") translate([180, 240, 0]) knmnt_l_bar1();
if (PART == "knmnt_l_bar1") knmnt_l_bar1();
if (PART == "all") translate([240, 240, 0]) knmnt_l_bar2();
if (PART == "knmnt_l_bar2") knmnt_l_bar2();
if (PART == "all") translate([0, 300, 0]) knmnt_r_bar1();
if (PART == "knmnt_r_bar1") knmnt_r_bar1();
if (PART == "all") translate([60, 300, 0]) knmnt_r_bar2();
if (PART == "knmnt_r_bar2") knmnt_r_bar2();
if (PART == "all") translate([120, 300, 0]) rollhorn_l();
if (PART == "rollhorn_l") rollhorn_l();
if (PART == "all") translate([180, 300, 0]) rollhorn_r();
if (PART == "rollhorn_r") rollhorn_r();
if (PART == "all") translate([240, 300, 0]) rollmnt_l_bar2();
if (PART == "rollmnt_l_bar2") rollmnt_l_bar2();
if (PART == "all") translate([0, 360, 0]) rollmnt_r_bar2();
if (PART == "rollmnt_r_bar2") rollmnt_r_bar2();
if (PART == "all") translate([60, 360, 0]) shdrive_l();
if (PART == "shdrive_l") shdrive_l();
if (PART == "all") translate([120, 360, 0]) shdrive_r();
if (PART == "shdrive_r") shdrive_r();
if (PART == "all") translate([180, 360, 0]) shell_front_part();
if (PART == "shell_front_part") shell_front_part();
if (PART == "all") translate([240, 360, 0]) shindrive_l_part();
if (PART == "shindrive_l_part") shindrive_l_part();
if (PART == "all") translate([0, 420, 0]) shindrive_r_part();
if (PART == "shindrive_r_part") shindrive_r_part();
if (PART == "all") translate([60, 420, 0]) shmnt_l_bar1();
if (PART == "shmnt_l_bar1") shmnt_l_bar1();
if (PART == "all") translate([120, 420, 0]) shmnt_l_bar2();
if (PART == "shmnt_l_bar2") shmnt_l_bar2();
if (PART == "all") translate([180, 420, 0]) shmnt_r_bar1();
if (PART == "shmnt_r_bar1") shmnt_r_bar1();
if (PART == "all") translate([240, 420, 0]) shmnt_r_bar2();
if (PART == "shmnt_r_bar2") shmnt_r_bar2();
if (PART == "all") translate([0, 480, 0]) shrollmnt_l_bar1();
if (PART == "shrollmnt_l_bar1") shrollmnt_l_bar1();
if (PART == "all") translate([60, 480, 0]) shrollmnt_l_bar2();
if (PART == "shrollmnt_l_bar2") shrollmnt_l_bar2();
if (PART == "all") translate([120, 480, 0]) shrollmnt_r_bar1();
if (PART == "shrollmnt_r_bar1") shrollmnt_r_bar1();
if (PART == "all") translate([180, 480, 0]) shrollmnt_r_bar2();
if (PART == "shrollmnt_r_bar2") shrollmnt_r_bar2();
if (PART == "all") translate([240, 480, 0]) sole_l_part();
if (PART == "sole_l_part") sole_l_part();
if (PART == "all") translate([0, 540, 0]) sole_r_part();
if (PART == "sole_r_part") sole_r_part();
if (PART == "all") translate([60, 540, 0]) spinedrive_part();
if (PART == "spinedrive_part") spinedrive_part();
if (PART == "all") translate([120, 540, 0]) thighdrive_l_part();
if (PART == "thighdrive_l_part") thighdrive_l_part();
if (PART == "all") translate([180, 540, 0]) thighdrive_r_part();
if (PART == "thighdrive_r_part") thighdrive_r_part();