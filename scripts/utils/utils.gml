function depth_sort(){
	// Depth sort
	depth =- y;
}

function close_to_player() {
	// Based on an item's look_distance see if the player is nearby
	if distance_to_object(obj_player) <= look_distance {
		return true;
	}
	
	// Default to false if player isn't nearby
	return false
}

function draw_progress_meeter(_val_to_check, _x, _y, _y_offset) {
	/*
	Utilize this whenever sending in a need to display a progress meeter
	*/
	
	// Draw the progress meeter
	var _max_progress_width = 32;
	var _max_progress_height = 8;
	var _progress_x_offset = _x;
	var _progress_y_offset = _y - _y_offset;

	
	draw_sprite_stretched(
		spr_menu_item_interaction,
		0,
		_progress_x_offset,
		_progress_y_offset,
		_max_progress_width,
		_max_progress_height
	);

	var _max_progress_indicator_width = 27;
	var _progress_val = _max_progress_indicator_width * (_val_to_check / 100);
	var _progress_bar_increase_width = floor(_progress_val);
	draw_sprite_stretched(
		spr_progress_meter,
		0,
		_progress_x_offset+3,
		_progress_y_offset+3,
		_progress_bar_increase_width,
		2
	);
}