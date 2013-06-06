// Main Frame for the PrintrCamBot by Carlosgs (http://carlosgs.es)

include <DropcamHolder.scad>
use <obiscad/bcube.scad>

mainFrame_diameter = 2*dh_ringRadius+idleHolderLen; // [mm]
mainFrame_plate_thickness = 10; // [mm]


mainFrame_plate_extraRadius = 10;

mf_ringRadius = mainFrame_diameter/2+mainFrame_plate_extraRadius;

mf_idleHolderDiam = idleHolderDiam*2;
mf_idleHolderLen = idleHolderLen/2;

mf_axisHoleDiam = idleHolderDiam+1.2;

mf_ringCutOut = 10;

servo_knobFromScrew = 18;

module mf_holderRing() {
	difference() {
		cylinder(r=mf_ringRadius,h=mainFrame_plate_thickness,center=true,$fn=60);
		cylinder(r=mainFrame_diameter/2,h=mainFrame_plate_thickness*2,center=true,$fn=50);
		translate([-200/2,0,0])
			cube([200,200,200],center=true);
	}
}


module mf_idleHolder() {
	cylinder(r=mf_idleHolderDiam/2,h=mf_idleHolderLen*2,center=true,$fn=20);
}


// Servo screws
screwOffset = 2.4;
screwDistFromKnobAxis = 13;
screwSupport_h = 8.5;
screwSupport_w = 5;
screwDist = 10;
screwDiam = 3;

servoAxisOffset = 2;

module screws() {
	translate([0,screwDist/2,0]) {
		cylinder(r=screwDiam/2,h=100,center=true,$fn=20);
	}
	translate([0,-screwDist/2,0]) {
		cylinder(r=screwDiam/2,h=100,center=true,$fn=20);
	}
}

module FrameServoHolder() {
	difference() {
		bcube([screwSupport_w,screwSupport_h,screwDist*2],cr=1,cres=5);
		rotate([0,90,0]) rotate([0,0,90]) screws();
	}
}


module mainFrame() {
	difference() {
		union() {
			mf_holderRing();
			translate([-servo_knobFromScrew-dh_ringRadius-idleHolderLen-screwSupport_w/2,-screwDistFromKnobAxis,servoAxisOffset])
				FrameServoHolder();
			hull() {
				translate([0,-mf_ringRadius+mainFrame_plate_extraRadius/2,0])
					cube([0.01,mainFrame_plate_extraRadius,mainFrame_plate_thickness],center=true);
				translate([-servo_knobFromScrew-dh_ringRadius-idleHolderLen-screwSupport_w/2,-screwDistFromKnobAxis-screwSupport_h/2,servoAxisOffset])
					bcube([screwSupport_w,screwSupport_h/2,screwDist*2],cr=1,cres=5);
			}

			translate([mf_ringRadius-mainFrame_plate_extraRadius,0,0]) rotate([0,90,0])
				mf_idleHolder();

			// Top servo holder
			rotate([0,0,90]) translate([-mf_ringRadius,0,0]) rotate([0,-90,0]) rotate([0,0,45])
				servoHolder(holeAngle=45);
		}


		//Screws for the top servo
		rotate([0,0,90]) translate([-mf_ringRadius,0,0]) rotate([0,-90,0]) rotate([0,0,45])
			for(i=[0:nholes-1])
				rotate( [0, 0, i*360/(nholes)+45], $fn=20 )
					translate( [hole_distance_from_center, 0] )
						cylinder( r=holes_diam/2, h=100, center=true, $fn=30 );

		translate([0,0,-mainFrame_plate_thickness/2-100/2])
			cube([200,200,100],center=true);
		translate([0,mf_ringCutOut+200/2,0])
			cube([200,200,100],center=true);
		// Axis hole
		rotate([0,90,0]) cylinder(r=mf_axisHoleDiam/2,h=200,$fn=7);
		// Axis hole
		rotate([90,0,0]) cylinder(r=axisHoleDiam/2,h=200,center=true,$fn=6);
	}
}

%dropCamHolder();

mainFrame();

