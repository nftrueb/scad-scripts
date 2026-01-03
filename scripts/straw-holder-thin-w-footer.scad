
$fn=50;

cutout_r = 5.5; 
    
module end(i) { 
    translate([0,100*i,0])
    difference() { 
        union() { 
            translate([-9,-10,0]) cube([18, 20, 60]);
            translate([9,-10,0]) cube([cutout_r, 20, 9]); 
            translate([-9-cutout_r,-10,0]) cube([cutout_r, 20, 9]);
        }
        
        //void(); 
    }
   
}

module void() { 
    translate([0,0,9])
    hull() {
        rotate([90,0,0]) cylinder(55, cutout_r, cutout_r, center=true); 
        translate([0,0,60]) rotate([90,0,0])  cylinder(50, cutout_r, cutout_r, center=true); 
    }
    
    translate([9+cutout_r,0,9])
    hull() {
        rotate([90,0,0]) cylinder(55, cutout_r, cutout_r, center=true); 
        translate([0,0,60]) rotate([90,0,0])  cylinder(50, cutout_r, cutout_r, center=true); 
    }
    
    translate([-9-cutout_r,0,9])
    hull() {
        rotate([90,0,0]) cylinder(55, cutout_r, cutout_r, center=true); 
        translate([0,0,60]) rotate([90,0,0])  cylinder(50, cutout_r, cutout_r, center=true); 
    }
}

module bridge() { 
    difference() {
        translate([-6,0,0]) cube([12,100,2]);
        
        for(i = [0:1:6]) { 
            translate([0, 20 + 10*i, -10]) cylinder(30, 3, 3);
        }
    }
}

bridge(); 

for(i = [0:1:1]) { 
    end(i); 
}






