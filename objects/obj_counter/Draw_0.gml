/// @description 

// Make sure the draw self is "under" any other carried item
draw_self();


// Draw the item the player is carrying
if currently_holding != -1 {	
	var _spr_x_offset = x + 8;
	var _spr_y_offset = y - 32;

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

