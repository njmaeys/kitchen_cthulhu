/// @description


// TODO: Create a pop up for this to confirm open for the day
// Basics
mouse_hovering = false;
look_distance = 32;
player_nearby = false;
image_index = 0;

// Create the player lighting
open_sign_light_source = instance_create_depth(
	x + 24,
	y + 12,
	self.depth - 2,
	obj_lighting_cutout
);
open_sign_light_source.color = #0AC9B3;
open_sign_light_source.intensity = 0.5;


