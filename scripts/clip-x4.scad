
$fn = 50; 

w = 35; 
l = 15; 
h = 10; 

module imported_clip() { 
    color("Green") { 
        translate([9,1, -10]) import("clip-x1.off");
    }
}

module clip() { 
    cube([w, l, h], center=true); 
}

module body() { 
    difference() {
        translate([2.5,0,0]) cylinder(10, 6.5, 6.5); 
        translate([2.5,0,-1]) cylinder(12, 4.5, 4.5); 
        translate([-7,-10,-1]) cube([10,20,12]); 
    }
}

module arm(mirror) { 
    off = mirror ? 1 : -1; 
    hull() { 
        translate([0, off * 1.5, 0]) cylinder(10, 1, 1); 
        translate([-12, off * 1.5, 0]) cylinder(10, 1, 1); 
    }

    difference() { 
        translate([-14, off * 3.5, 0]) cylinder(10, 3, 3); 
        hull() { 
            translate([-13, off * 3.5, -1]) cylinder(12, 1, 1); 
            translate([-10, off * 3.5, -1]) cylinder(12, 1, 1); 
        }
    }
    
    translate([6 + 5, off * (6.5-1.75), 5]) cube([10, 3.5, 10], center=true); 
    
    // grip
    for (i=[0:1:3]) { 
        translate([9 + 1.5*i, off * 6.5, 0]) cylinder(h, .5, .5); 
    }
    
    // making side flush 
    translate([-(14.5-15), off * (6.5-1), 5]) cube([30, 2, 10], center=true); 
    
    // teeth 
    for (i=[0:1:8]) { 
        translate([-1.5*i + (off-1)*0.4, off * .5, 0]) cylinder(h, .5, .5); 
    }
}

module arms() { 
    difference() { 
    union() { 
        arm(mirror = false); 
        arm(mirror = true);
    } 
     
    hull() { 
        translate([-13, -1 * 3.5, -1]) cylinder(12, 1, 1); 
        translate([-10, -1 * 3.5, -1]) cylinder(12, 1, 1); 
    }   
}
}

// imported_clip();

module clip() { 
    body(); 
    arms(); 
}

for (i=[0:1:4]) {
    translate([0,30*i,0]) clip(); 
}
