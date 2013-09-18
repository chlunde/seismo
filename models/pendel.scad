dia_piezo=27.0;
thickness_piezo=0.33+0.1;
dia_sphere=17.3;
thickness=3;
length=50;

translate([0,0,length])
    rotate([90,0,90]) {
/* Piezo
        color([1,0,0])
            linear_extrude(height=0.31, center=true) {
                circle(r=dia_piezo/2);
            }
*/
        difference() {
            linear_extrude(height=thickness, center=true)
                circle(r=dia_piezo/2+thickness/2);

            linear_extrude(height=thickness+1, center=true)
                circle(r=dia_piezo/2-4);

            linear_extrude(height=thickness_piezo, center=true)
                circle(r=dia_piezo/2);

            translate([0,12,0])
                linear_extrude(height=thickness+1, center=true)
                    square([30,30],center=true);
        }
    }


difference() {
    union() {
        cube(size=[10,thickness,length+22], center=true);
        sphere(r=(dia_sphere)/2+thickness, $fn=30);
    }
    sphere(r=dia_sphere/2, $fn=30);
    translate([-20-thickness/2,-50,-50]) {
        cube(size=[20,100,200]);
    }
    translate([thickness/2,-50,-50]) {
        cube(size=[20,100,90]);
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
