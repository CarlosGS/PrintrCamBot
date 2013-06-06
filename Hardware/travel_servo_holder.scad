// Travel Servo Holder for the PrintrCamBot by Carlosgs (http://carlosgs.es)

use <obiscad/bcube.scad>

servo_h = 37+0.4;
servo_w = 19.22+0.4;

holder_w = 10;

holder_thickness = 7;

base_truncation = holder_thickness-3;
side_truncation = holder_thickness-4;

screwOffset = 2.4;

screwDistFromOrig = servo_h/2+screwOffset;
screwSupport_h = 5;

screwDist = 10+1;// We add a millimiter to increase tension, and thus have a better grip on the servo

screwDiam = 3;

module screws() {
	translate([0,screwDist/2,0]) {
		cylinder(r=screwDiam/2,h=100,center=true,$fn=20);
	}
	translate([0,-screwDist/2,0]) {
		cylinder(r=screwDiam/2,h=100,center=true,$fn=20);
	}
}

difference() {
	translate([base_truncation/2,0,0])
		bcube([servo_h+holder_thickness*2-base_truncation,servo_w+holder_thickness*2-side_truncation*2,holder_w],cr=2,cres=5);
	cube([servo_h,servo_w,holder_w*2],center=true);
	translate([screwDistFromOrig,0,0]) screws();
	translate([screwDistFromOrig,0,0]) cube([servo_h,screwDist/4,holder_w*2],center=true);
}
