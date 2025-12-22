
$fn = 50; 

peg_l = 15; 
peg_r = 2.5; 

module peg(rad, is_male=true) { 
    padding = is_male ? 0 : .075;
    echo(padding); 
    minkowski() { 
        translate([-peg_l/2,0,0]) 
        rotate([0,90,0]) 
        cylinder(peg_l, peg_r+padding, peg_r+padding); 
        
        sphere(rad); 
    }
}

module male() { 
   
    translate([0,-15,0])
    cube([10, 30, 30]);
    
    translate([0, 0, 15])
    peg(1); 
    
}

module female() { 
    difference() { 
        
        translate([0,-15,0])
        cube([10, 30, 30]); 
        
        translate([10,0,15])
        peg(1, is_male=false);
        
        translate([10,0,15])
        rotate([0,90,0])
        rotate_extrude()
        translate([peg_r+1,0,0])
        circle(1); 
        
    }
    
}


//translate([0,0,10])
//rotate([0,90,0])
//male(); 


translate([-50,0,0])
rotate([0,-90,0])
female(); 




