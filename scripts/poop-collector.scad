
$fn=25;

*difference() { 
    linear_extrude(50) minkowski() { 
        square(48, center=true); 
        circle(1);
    }
    
    translate([0,0,2]) linear_extrude(50) minkowski() { 
        square(40, center=true); 
        circle(1);
    }
    translate([0,-25,-1]) cube([50,50,60]);
}

difference() { 
    cylinder(50, 25, 25);
    translate([0,0,4]) cylinder(51, 21, 21); 
    translate([-25,-25,0]) cube([25,50,51]);   
}

translate([0,0,50]) difference() { 
    sphere(25);
    sphere(21);
    translate([-25,0,0]) cube(50,50,50, center=true);
    translate([0,0,-25]) cube(50,50,50, center=true);
}
