$fa = 1;
$fs = 0.5;

vase_rad = 51.5; 
h = 10;  // cavity height
t = 4;   // wall thickness
s_r = 2; // sphere radius
footer_rad = 7; // footer is 12.7mm in diameter

difference() { 
    minkowski() { 
        cylinder(t+h, vase_rad+t, vase_rad+t); 
        sphere(s_r); 
    }

    translate([0,0,t]) 
    minkowski() { 
        cylinder(h*2, vase_rad, vase_rad); 
        sphere(s_r); 
    }
    
    for(i = [-1 : 2 : 1]) { 
        translate([i*40,0,-10]) cylinder(10,footer_rad,footer_rad); 
    }
    
    for(i = [-1 : 2 : 1]) { 
        translate([0,i*40,-10]) cylinder(10,footer_rad,footer_rad); 
    }
    
   
    translate([10,-5,-s_r-1]) 
    linear_extrude(s_r+1)
    rotate([0,180,0]) 
    text("NT",center=true); 
}
