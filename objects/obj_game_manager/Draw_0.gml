/// @description 

// TODO: Move to function
if game_paused {
	var _menu_x = camera_x - pause_x_offset;
	var _menu_y = camera_y - pause_y_offset;
	draw_sprite_stretched_ext(
		spr_menu_item_interaction,
		0,
		_menu_x,
		_menu_y,
		pause_width,
		pause_height,
		c_white,
		1
	);
	
	// Close button (esc also closes)
	var _close_width = sprite_get_width(spr_close);
	var _close_height = sprite_get_height(spr_close);
	var _close_x = _menu_x + pause_width - (_close_width / 2) - 2;
	var _close_y = _menu_y - (_close_height / 2) + 2;
	var _mouse_on_close = point_in_rectangle(
		mouse_x,
		mouse_y,
		_close_x,
		_close_y,
		_close_x + _close_width,
		_close_y + _close_height
	);
	
	var _close_index = 0;
	if _mouse_on_close {
		_close_index = 1;
		
		// Unpause with close button
		if mouse_check_button_pressed(mb_left) {
			obj_game_manager.game_paused = !obj_game_manager.game_paused;
		}
	}
	
	draw_sprite(
		spr_close,
		_close_index,
		_close_x,
		_close_y
	);
}



