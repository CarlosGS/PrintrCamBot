// DropCam dummy model by Carlosgs (http://carlosgs.es)

// Adjust to real values before printing!

dropcam_diameter = 45; // [mm]
dropcam_diameter_small = 45-2; // [mm]
dropcam_outer_diameter = 57.15; // [mm]
dropcam_total_h = 31.75; // [mm]

dropcam_thick_h = 12; // [mm]

dropcam_lens_margin = 8;
dropcam_lens_radius = 8;

union() {
	translate([0, 0, dropcam_thick_h/2])
		rotate_extrude(convexity = 10, $fn = 100)
			translate([dropcam_outer_diameter/2-dropcam_thick_h/2, 0, 0])
				circle(r = dropcam_thick_h/2, $fn = 100);
	cylinder(r=dropcam_outer_diameter/2-dropcam_thick_h/2,h=dropcam_thick_h);
	translate([0, 0, dropcam_thick_h]) {
		cylinder(r1=dropcam_diameter/2,r2=dropcam_diameter_small/2,h=dropcam_total_h-dropcam_thick_h-dropcam_lens_margin,$fn=100);
	}
	translate([0, 0, dropcam_total_h-dropcam_lens_margin]) {
		rotate_extrude(convexity = 10, $fn = 100)
			translate([dropcam_diameter_small/2-dropcam_lens_margin, 0, 0])
				circle(r = dropcam_lens_margin, $fn = 100);
	}
	translate([0, 0, dropcam_total_h-dropcam_lens_margin-3])
		sphere(r=dropcam_lens_radius,$fn=30);
}

%translate([0,0,dropcam_total_h/2]) cube([dropcam_outer_diameter,dropcam_outer_diameter,dropcam_total_h],center=true);