
//$fa = 1;
//$fs = 0.5;

$fn = 200; 

peg_l = 15; 
peg_r = 2.5; 

br_bot = 15;
br_top = 18; 
bt = 2;
bh = 6+bt; 
 

module peg(rad, is_male=true) { 
    padding = is_male ? 0 : .055;
    echo(padding); 
    minkowski() { 
        translate([-peg_l/2,0,0]) 
        rotate([0,90,0]) 
        cylinder(peg_l, peg_r+padding, peg_r+padding); 
        
        sphere(rad); 
    }
}

module base() { 
    difference() { 
        cylinder(bh, br_bot, br_top); 
        
        translate([0,0,bt])
        cylinder(bh, br_bot-bt/2, (br_bot-bt/2)+1); 
    }
}

module stand() { 
    base(); 
    
    translate([0,0,peg_l/2+1])
    rotate([0,90,0])
    peg(1); 
}

//translate([0,0,peg_l/2+1])
//rotate([0,90,0])
//peg(1); 


for (i=[0:1:2]) { 
    translate([i*br_top*3,0,0])
    stand(); 
}