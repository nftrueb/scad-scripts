
$fn=50;


for(i = [0:1:1]) { 
    translate([0,100*i,0])
    difference() { 
        translate([-9,-10,0]) cube([18, 20, 60]);
        
        #translate([0,0,9])
        hull() {
            rotate([90,0,0]) cylinder(55, 6.25, 6.25, center=true); 
            translate([0,0,60]) rotate([90,0,0])  cylinder(50, 6.25, 6.25, center=true); 
        }
    }
}

difference() {
    translate([-6,0,0]) cube([12,100,2]);
    
    for(i = [0:1:6]) { 
        translate([0, 20 + 10*i, -10]) cylinder(30, 3, 3);
    }
}






