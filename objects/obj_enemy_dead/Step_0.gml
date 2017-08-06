if (done == 0) {
	vsp = vsp + grv;

	// Collision variables
	is_on_the_floor = place_meeting(x, y + 1, obj_wall);


	// Horizontal collision
	if (place_meeting(x + hsp, y, obj_wall)) {
		while(!place_meeting(x + sign(hsp), y, obj_wall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	// Vertical collision
	if (place_meeting(x, y + vsp, obj_wall)) {
		if (vsp > 0) {
			done = 1;
			image_index = 1;
		}
		while(!place_meeting(x, y + sign(vsp), obj_wall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}