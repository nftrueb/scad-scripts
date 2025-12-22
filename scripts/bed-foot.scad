$fn = 50; 

peg_l = 15; 
peg_r = 2.5; 

wall_t = 12; 

w = 80 + wall_t*2; 
l = w/2; 
h = 127; 

module peg(rad, is_male=true) { 
    padding = is_male ? 0 : .75;
    echo(padding); 
    minkowski() { 
        translate([-peg_l/2,0,0]) 
        rotate([0,90,0]) 
        cylinder(peg_l, peg_r+padding, peg_r+padding); 
        
        sphere(rad); 
    }
}

module body() { 
    difference() { 
        union() { 
            // outer 
            translate([0,0,h/2])
            cube([w-wall_t*2, l, h], center=true);      
            
            // outer
            translate([0,0,h/2])
            cube([w-wall_t*2, l, h], center=true); 
            
            // outer
            translate([0,wall_t/2,h/2])
            cube([w, l-wall_t, h], center=true); 
            
            // corner
            intersection() { 
                translate([w/2-wall_t, -l/2+wall_t, 0])
                cylinder(h, wall_t, wall_t); 
                
                translate([w/2-wall_t, -l/2+wall_t, h/2])
                cube([wall_t*2, wall_t*2, h], center=true); 
            }
            
            // corner
            intersection() { 
                translate([-w/2+wall_t, -l/2+wall_t, 0])
                cylinder(h, wall_t, wall_t); 
                
                translate([-w/2+wall_t, -l/2+wall_t, h/2])
                cube([wall_t*2, wall_t*2, h], center=true); 
            }
            
            // top side
            hull() { 
                translate([w/2-wall_t,-l/2+wall_t,h])
                sphere(wall_t); 
                
                translate([-w/2+wall_t,-l/2+wall_t,h])
                sphere(wall_t); 
            }
            
            // top side
            hull() { 
                translate([w/2-wall_t,-l/2+wall_t,h])
                sphere(wall_t); 
                
                translate([w/2-wall_t,l/2,h])
                sphere(wall_t); 
            }
            
            // top side
            hull() { 
                translate([-w/2+wall_t,-l/2+wall_t,h])
                sphere(wall_t); 
                
                translate([-w/2+wall_t,l/2,h])
                sphere(wall_t); 
            }
            
            // top
            translate([-40,-l/2+wall_t,h])
            cube([80, l-wall_t, wall_t]);
        }
        
        translate([0,wall_t,h/2-15])
        cube([w-wall_t*2, l, h+30], center=true); 
        
        translate([0, l/2+10, h/2])
        cube([w+20, 20, h+30], center=true); 
        
        translate([-15,-l/2+wall_t,h-wall_t/2])
        cube([30, l, wall_t*2]); 
    }
}

module male() { 
    
    body(); 
    
    translate([w/2 - wall_t/2, l/2, h/4])
    rotate([0,0,90])
    peg(1); 
    
    translate([w/2 - wall_t/2, l/2, h/4*3])
    rotate([0,0,90])
    peg(1); 
    
    translate([-w/2 + wall_t/2, l/2, h/4])
    rotate([0,0,90])
    peg(1); 
    
    translate([-w/2 + wall_t/2, l/2, h/4*3])
    rotate([0,0,90])
    peg(1); 
    
    
}

module female() {   
    difference() { 
        body(); 
        
        // PEG 1
        translate([w/2 - wall_t/2, l/2, h/4])
        rotate([0,0,90])
        peg(1, false); 
        
        translate([w/2 - wall_t/2, l/2, h/4])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r+1.5,0,0])
        circle(1); 
        
        // PEG 2
        translate([w/2 - wall_t/2, l/2, h/4*3])
        rotate([0,0,90])
        peg(1, false); 
     
        translate([w/2 - wall_t/2, l/2, h/4*3])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r+1.5,0,0])
        circle(1); 
        
        // PEG 3
        translate([-w/2 + wall_t/2, l/2, h/4])
        rotate([0,0,90])
        peg(1, false); 
       
        translate([-w/2 + wall_t/2, l/2, h/4])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r+1.5,0,0])
        circle(1); 
        
        // PEG 4
        translate([-w/2 + wall_t/2, l/2, h/4*3])
        rotate([0,0,90])
        peg(1, false); 
        
        translate([-w/2 + wall_t/2, l/2, h/4*3])
        rotate([90,0,0])
        rotate_extrude()
        translate([peg_r+1.5,0,0])
        circle(1); 
    }
}

//translate([200,0,l/2])
//rotate([90,0,0])
//male(); 

//translate([0,0,l/2])
//rotate([90,0,0])
female(); 