// DropCamHolder for the PrintrCamBot by Carlosgs (http://carlosgs.es)

dropcam_diameter = 45; // [mm] Adjust to real value before printing!
dropcam_plate_thickness = 5; // [mm]


dropcam_plate_extraRadius = 10;

dh_ringRadius = dropcam_diameter/2+dropcam_plate_extraRadius;

idleHolderDiam = 8;
idleHolderLen = 8;

servoHolderDiam = 20;
servoHolderLen = 8/2;

axisHoleDiam = 4;

module holderRing() {
	difference() {
		cylinder(r=dh_ringRadius,h=dropcam_plate_thickness,center=true,$fn=60);
		cylinder(r=dropcam_diameter/2,h=dropcam_plate_thickness*2,center=true,$fn=50);
	}
}



nholes = 4;
hole_distance_from_center = 6.45;
holes_diam = 2;

module servoHolder(holeAngle=90) {
	difference() {
		cylinder(r=servoHolderDiam/2,h=servoHolderLen*2,center=true,$fn=30);
		//screws
		for(i=[0:nholes-1])
			rotate( [0, 0, i*360/(nholes)+45], $fn=20 )
				translate( [hole_distance_from_center, 0] )
					cylinder( r=holes_diam/2, h=100, center=true, $fn=30 );
		// Hole for the middle screw
		translate([0,0,2]) rotate([0,0,holeAngle]) cylinder(r=axisHoleDiam,h=10,$fn=6);
	}
}




module idleHolder() {
	cylinder(r=idleHolderDiam/2,h=idleHolderLen*2,center=true,$fn=20);
}

module dropCamHolder() {
	difference() {
		union() {
			holderRing();
			translate([dh_ringRadius,0,0]) rotate([0,90,0])
				idleHolder();
			translate([-dh_ringRadius,0,0]) rotate([0,-90,0])
				servoHolder();
		}
		translate([0,0,-dropcam_plate_thickness/2-100/2])
			cube([100,100,100],center=true);
		// Axis hole
		rotate([0,90,0]) rotate([0,0,90]) cylinder(r=axisHoleDiam/2,h=200,center=true,$fn=6);
	}
}

//dropCamHolder();
