basesize = 60;
baseheight = 5;
poleradi = 3;

height = 100;

module dings() {
    color([0,1,0]) {
        translate([0,0,baseheight/2])
            cube([basesize/1.5, basesize/1.5, baseheight], center=true);

        translate([0,0,-0.5])
            cube([basesize/2, basesize/2, baseheight+1], center=true);
    }
}

module bunn(margin) {
    color([1,0,0]) {
        union() {
            cube([basesize, basesize, baseheight], center=true);

            translate([basesize/2 - 2*poleradi,basesize/2 - 2*poleradi,0])
                cylinder(height, poleradi+margin, poleradi+margin, $fn=32);

            translate([-(basesize/2 - 2*poleradi), basesize/2 - 2*poleradi,0])
                cylinder(height, poleradi+margin, poleradi+margin, $fn=32);

            translate([basesize/2 - 2*poleradi, -(basesize/2 - 2*poleradi),0])
                cylinder(height, poleradi+margin, poleradi+margin, $fn=32);

            translate([-(basesize/2 - 2*poleradi),-(basesize/2 - 2*poleradi),0])
                cylinder(height, poleradi+margin, poleradi+margin, $fn=32);
        }
    }
}

module topp() {
    color([0,0,1]) {
        difference() {
            translate([0, 0, height - baseheight / 4]) {
                difference() {

                    cube([basesize, basesize, baseheight], center=true);
                    dings();
                }
            }
            bunn(0.2);
        }
    }
}

//translate([0, 0, height + 10])
dings();
//bunn(0);
//topp();

