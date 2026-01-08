$fa = 1; 
$fs = 0.5; 

pad = 1;
//hl = 121 + pad; 
//hw = 121 + pad; 
//hh = 42 + pad;
hl = 121 + pad; 
hw = 121 + pad; 
hh = 42 + pad; 

t = 3;   // wall thickness
dt = 21; // desk thickness

module body() { 
    difference() { 
        cube([hw+2*t, hl+2*t, hh+2*t], center=true); 
        
        translate([t, 0, 0])
        cube([hw+t/2, hl, hh], center=true);  
        
        translate([-t*2, 0, 0])
        cube([hw, hl-t, hh], center=true); 
        
        cube([hw-t, hl+t*3, hh], center=true); 
    } 
}

module hanger() { 
    translate([0, 0, hh/2 + t/2 + t + dt])
    cube([hw+2*t, hl+2*t, t], center=true); 

    translate([hw/2 + t*3/2, 0, (dt+t)/2 + (hh)/2 + t])
    cube([t, hw+t*2, dt+t], center=true);
}

module support() { 
    hull() { 
        translate([hw/2 + t/2 + t, hl/2 + t/2, hh/2 + t/2])
        cube([t,t,t], center=true); 

        translate([hw/2 + t/2, hl/2 + t/2, -hh/2 - t/2])
        cube([t,t,t], center=true); 
    }

    hull() { 
        translate([hw/2 + t/2 + t, -hl/2 - t/2, hh/2 + t/2])
        cube([t,t,t], center=true); 

        translate([hw/2 + t/2, -hl/2 - t/2, -hh/2 - t/2])
        cube([t,t,t], center=true); 
    }
    
    translate([hw/2 + t + t/2, 0, hh/2 + t/2]) 
    cube([t, hl+t*2, t], center=true);
}

module shelf() { 
    body(); 
    hanger(); 
    support(); 
}

module demo_cube() { 
    translate([hw*3,hl/2+pad,0])
    rotate([90,0,0])
    cube([hw-pad, hl-pad, hh-pad], center=true); 
}

//rotate([90,0,0])
shelf();

demo_cube(); 
