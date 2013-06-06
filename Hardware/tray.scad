// Tray for the PrintrCamBot by Carlosgs (http://carlosgs.es)

use <obiscad/bcube.scad>

tray_w = 130; // [mm]
tray_h = 50; // [mm]
tray_thickness = 7;
tray_floor_thickness = 0.9;

holder_w = 10;

front_truncation = tray_thickness-3;
side_truncation = tray_thickness-3;

screwOffset = 2.4;

screwDistFromOrig = tray_h/2+screwOffset;
screwSupport_h = 5;

screwDist = 10;

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
	translate([front_truncation/2,0,0])
		bcube([tray_h+tray_thickness*2-front_truncation,tray_w+tray_thickness*2-side_truncation*2,holder_w],cr=2,cres=5);
	translate([0,0,tray_floor_thickness])
		cube([tray_h,tray_w,holder_w],center=true);
	translate([screwDistFromOrig,0,0]) screws();
}
