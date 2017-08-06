key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);

// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

// Collision variables
is_on_the_floor = place_meeting(x, y + 1, obj_wall);

// Jump
if (is_on_the_floor && key_jump)  {
	vsp = -7;
}

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
	while(!place_meeting(x, y + sign(vsp), obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animations
if (is_on_the_floor) {
	if (hsp == 0) {
		// freeze 
		sprite_index = spr_player;
	} else {
		// running
		sprite_index = spr_player_running;
		image_speed = 1;
	}
} else  {
	// falling or jumping
	sprite_index = spr_player_air;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}

// face right and left
if (hsp != 0) image_xscale = sign(hsp);