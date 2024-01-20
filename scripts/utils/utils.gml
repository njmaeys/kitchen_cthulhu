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

function draw_progress_meeter(_val_to_check, _x, _y, _y_offset, _spr_meter) {
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
		_spr_meter,
		0,
		_progress_x_offset+3,
		_progress_y_offset+3,
		_progress_bar_increase_width,
		2
	);
}

function copy_struct(_struct){
    var _key, _value;
    var _new_copy = {};
    var _keys = variable_struct_get_names(_struct);
    for (var _i = array_length(_keys)-1; _i >= 0; --_i) {
            _key = _keys[_i];
            _value = _struct[$ _key];
            variable_struct_get(_struct, _key);
            variable_struct_set(_new_copy, _key, _value)
    }
    return _new_copy;
}