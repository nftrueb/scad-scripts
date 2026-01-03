$fn = 50; 

peg_l = 15; 
peg_r = 2.5; 

wall_t = 12; 
ct = 6; // ceiling and back thickness
corner_r = 6; 

w = 80 + wall_t*2; 
l = w/2; 
h = 127; 
h2 = h + wall_t/2;

module peg(rad, is_male=true) { 
    padding = is_male ? 0 : .055;
    echo(padding); 
    minkowski() { 
        translate([-peg_l/2,0,0]) 
        rotate([0,90,0]) 
        cylinder(peg_l, peg_r+padding, peg_r+padding); 
        
        sphere(rad); 
    }
}

module body2() { 
    // outer 
    translate([0,-ct/2,h2/2])
    cube([w-wall_t*2 + corner_r*2, ct, h2], center=true);      
    
    translate([-w/2+corner_r,l/2,h2/2])
    cube([wall_t, l, h2], center=true); 
    
    translate([-w/2+corner_r, 0, 0])
    cylinder(h2, corner_r, corner_r); 
    
    translate([w/2-corner_r,l/2,h2/2])
    cube([wall_t, l, h2], center=true); 
    
    translate([w/2-corner_r, 0, 0])
    cylinder(h2, corner_r, corner_r); 
    
 
    hull() { 
        translate([w/2-corner_r, 0, h2])
        sphere(corner_r); 
        
        translate([w/2-corner_r, l, h2])
        rotate([90,0,0])
        cylinder(10, corner_r, corner_r); 
    }
    
    hull() { 
        translate([-w/2+corner_r, 0, h2])
        sphere(corner_r); 
        
        translate([-w/2+corner_r, l, h2])
        rotate([90,0,0])
        cylinder(10, corner_r, corner_r); 
    }
    
    hull() { 
        translate([-w/2+corner_r, 0, h2])
        sphere(corner_r); 
        
        translate([w/2-corner_r, 0, h2])
        sphere(corner_r); 
    }
    
    translate([10+wall_t/2,0,h2])
    cube([30, l, ct]);
    
    translate([-10-wall_t/2-30,0,h2])
    cube([30, l, ct]);
    
}

module male() { 
    body2(); 
    
    translate([w/2 - wall_t/2, l, h/4])
    rotate([0,0,90])
    peg(1); 
    
    translate([w/2 - wall_t/2, l, h/4*3])
    rotate([0,0,90])
    peg(1); 
    
    translate([-w/2 + wall_t/2, l, h/4])
    rotate([0,0,90])
    peg(1); 
    
    translate([-w/2 + wall_t/2, l, h/4*3])
    rotate([0,0,90])
    peg(1); 
}

module female() {   
    difference() { 
        body2(); 
        
        // PEG 1
        translate([w/2 - wall_t/2, l, h/4])
        rotate([0,0,90])
        peg(1, false); 
        
        translate([w/2 - wall_t/2, l, h/4])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r*1.3,0,0])
        circle(1); 
        
        // PEG 2
        translate([w/2 - wall_t/2, l, h/4*3])
        rotate([0,0,90])
        peg(1, false); 
     
        translate([w/2 - wall_t/2, l, h/4*3])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r*1.3,0,0])
        circle(1); 
        
        // PEG 3
        translate([-w/2 + wall_t/2, l, h/4])
        rotate([0,0,90])
        peg(1, false); 
       
        translate([-w/2 + wall_t/2, l, h/4])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r*1.3,0,0])
        circle(1); 
        
        // PEG 4
        translate([-w/2 + wall_t/2, l, h/4*3])
        rotate([0,0,90])
        peg(1, false); 
        
        translate([-w/2 + wall_t/2, l, h/4*3])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r*1.3,0,0])
        circle(1); 
    }
}

translate([120,0,])
rotate([90,0,0])
male(); 

translate([0,0,0])
rotate([90,0,0])
female(); 
