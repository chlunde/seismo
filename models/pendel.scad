dia_piezo=27.0;
thickness_piezo=1.33;
dia_sphere=17.3;
thickness=4;
thickness2=6;
length=72;

translate([0,0,length])
    rotate([90,0,90]) {
/* Piezo
        color([1,0,0])
            linear_extrude(height=0.31, center=true) {
                circle(r=dia_piezo/2);
            }
*/
        difference() {
            linear_extrude(height=thickness2, center=true)
                circle(r=dia_piezo/2+thickness/2);

            linear_extrude(height=thickness2+1, center=true)
                circle(r=dia_piezo/2-4);

            linear_extrude(height=thickness_piezo, center=true)
                circle(r=dia_piezo/2);

            translate([0,12,0])
                linear_extrude(height=thickness2+1, center=true)
                    square([100,30],center=true);
        }
    }


difference() {
    union() {
        cube(size=[10,thickness,length+44], center=true);
        sphere(r=(dia_sphere)/2+thickness, $fn=30);
    }
    sphere(r=dia_sphere/2, $fn=30);
    translate([-20-thickness2/2,-50,-50]) {
        cube(size=[20,100,200]);
    }
    translate([thickness2/2,-50,-50]) {
        cube(size=[20,100,122]);
    }
    translate([0,0,-55]) {
        cube(size=[100,100,100], center=true);
    }
}
/* Weight
color([1,0,0]) {
    sphere(r=dia_sphere/2, $fn=64);
}
*/
