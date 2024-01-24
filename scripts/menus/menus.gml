function draw_pause_menu() {
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
	
	// Interaction diagram
	var _interactions_offset_x = _menu_x + (pause_width * 0.66);
	var _interactions_offset_y = _menu_y;
	draw_sprite(
		spr_menu_interactions,
		0,
		_interactions_offset_x,
		_interactions_offset_y
	);
	
	// Menu buttons (Exit, Main Menu, Save)
	var _menu_button_sprites = [
		{
			name: "exit_game",
			spr: spr_exit_game,
		}, 
		{
			name: "main_menu",
			spr: spr_main_menu,
		}, 
	] // Temp til I add the others. 
	// TODO: Make these structs inside the array so I can have a case statement to take action when button click operation happens
	var _menu_buttons_offset_x = _menu_x + (pause_width * 0.5) - 24;
	var _menu_buttons_offset_y = _menu_y + 32;
	var _menu_button_width = 48;
	var _menu_button_height = 24;
	
	for (var _i = 0; _i < array_length(_menu_button_sprites); _i += 1) {
		var _item = _menu_button_sprites[_i];
		
		var _spr_index = 0;
		var _mouse_on_button = point_in_rectangle(
			mouse_x,
			mouse_y,
			_menu_buttons_offset_x,
			_menu_buttons_offset_y,
			_menu_buttons_offset_x + _menu_button_width,
			_menu_buttons_offset_y + _menu_button_height
		);
		
		if _mouse_on_button {
			_spr_index = 1;
			
			if mouse_check_button_pressed(mb_left) {
				show_debug_message(_item.name);
				pause_menu_button_interactions(_item.name);
			}
		}
		
		draw_sprite(
			_item.spr,
			_spr_index,
			_menu_buttons_offset_x,
			_menu_buttons_offset_y
		);
		
		_menu_buttons_offset_y += 32;
	}
	
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

function pause_menu_button_interactions(_button_name) {
	switch _button_name {
		case "exit_game":
			game_end();
			return;
	}
}