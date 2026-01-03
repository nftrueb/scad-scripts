$fa = 1;
$fs = 0.5; 

br = 22; 
tr = 15;
inset = 7; 
h = 12; 
t = 3; 

ballr = 40; 


module stand() {
    difference() { 
        cylinder(h, br, tr);
        
        translate([0,0,ballr+2]) 
        sphere(ballr); 
        
        translate([0,0,-1])
        cylinder(h+2, tr, tr); 
    }
}

stand(); 

translate([br*3, 0, 0])
stand(); 
