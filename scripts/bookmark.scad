$fn = 50;

w = 30; 
l = 70; 
h = 0.4; 

rows = 6; 
cols = 6; 


module holes() { 
    rad = 1; 
    intersection() { 
        translate([0,0,-h])
        cube([w, l, h*3]); 
        
        for (i=[0:1:cols]) { 
            for (j=[0:1:rows]) { 
                translate([w/cols*i, l/rows*j, -5])
                cylinder(10, rad, rad); 
            }
        }
    }
}

module holes2() { 
    
    rad = 2; 
    intersection() { 
        translate([0,0,-h])
        cube([w, l, h*3]); 
        
        for (i=[0:1:cols]) { 
            for (j=[0:1:rows]) { 
                translate([w/cols*i + rad/2, l/rows*j + rad/2, -5])
                cube([rad, rad, 10]); 
            }
        }
    }
}

module holes3() { 
    rad = 2; 
    intersection() { 
        translate([0,0,-h])
        cube([w, l, h*3]); 
        
        for (i=[0:1:cols]) { 
            for (j=[0:1:rows]) { 
                off = i % 2 == 1 ? l/rows/2 : 0; 
                translate([w/cols*i, l/rows*j + off, -5])
                cylinder(10, rad, rad); 
            }
        }
    }
}

difference() {
    //translate([-5,-5,0])
    //cube([w+10, l+10, h]); 
    
    linear_extrude(h) 
    translate([-5, -5, 0])
    minkowski() { 
        square([w+10, l+10]);
        circle(1);  
    }
    
   //holes();
   // holes2(); 
   holes3();  
}
