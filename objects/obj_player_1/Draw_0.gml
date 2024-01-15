/// @description 



// Make sure the draw self is "under" any other carried item
draw_self();


// Draw the item the player is carrying
if currently_carrying != -1 {
	if is_moving {
		if x + vx < x {
			currently_carrying_x_scale = -1;
		}
		else {
			currently_carrying_x_scale = 1;
		}
	}
	
	var _spr_x_offset = x;
	var _spr_y_offset = y - 16;

	draw_sprite_ext(
		currently_carrying.spr,
		0,
		_spr_x_offset,
		_spr_y_offset,
		currently_carrying_x_scale,
		1,
		0,
		c_white,
		1
	);
}
