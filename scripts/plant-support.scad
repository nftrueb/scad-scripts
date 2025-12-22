
h = 3; 
// tip vars
tw = 8; 

// arm vars
aw = 8;
al = 68; 

// head vars 
hl = 10; 

// length of tip is 20mm
module tip() {  
    hull() { 
       translate([10, -tw/4, 0]) cube([10, tw/2, h]); 
       translate([0, -tw/2, 0]) cube([10, tw, h]); 
    }
} 


module arm() { 
     cube([al, aw, h]); 
}

// approx 11mm
module head() { 
    rotate([0,0, 90])
    union() { 
        translate([-5.65,0,0])
        rotate([0, 0, 45]) 
        cube([aw, aw, h]); 
        
        translate([5.65,0,0])
        rotate([0, 0, 45]) 
        cube([aw, aw, h]); 
        
        translate([0,-5.65,0])
        rotate([0, 0, 45]) 
        cube([aw, aw, h]);
    }
}

module support() { 
    tip(); 
    translate([-al, -aw/2, 0]) arm(); 
    translate([-al, 0, 0]) head(); 
}

for (i=[0: 1: 2])  { 
    translate([0, 30*i, 0]) support(); 
}
