/// @description 

// Make sure the draw self is "under" any other carried item
draw_self();


// Draw the item the counter has on it
var _spr_x_offset = x + 8;
var _spr_y_offset = y - 32;

if currently_holding != -1 {	
	draw_sprite_ext(
		currently_holding.spr,
		0,
		_spr_x_offset,
		_spr_y_offset,
		1,
		1,
		0,
		c_white,
		1
	);
}


// Create the chop overlay
if currently_chopping 
	and !instance_exists(obj_chop_overlay) 
{
	instance_create_depth(
		_spr_x_offset,
		_spr_y_offset,
		obj_counter.depth - 1, // This isn't great but whatever, figure it out later
		obj_chop_overlay
	);	
}