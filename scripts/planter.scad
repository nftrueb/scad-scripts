

module rim() { 
    difference() { 
        translate([10, 0, 0]) sphere(10); 

        translate([-1,1,-11]) cube([22,10,22]); 
        translate([-1,-11,-11]) cube([22,10,22]); 
        
        translate([10, -2, -11]) cube([11,5,22]); 
        translate([-1, -2, -11]) cube([22, 5, 11]); 
    }
}

rim();