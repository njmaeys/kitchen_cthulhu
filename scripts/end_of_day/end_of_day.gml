function day_end_suammary(){
	var _day_end_width = 300;
	var _day_end_height = 200;
	var _day_end_x_offset = 150;
	var _day_end_y_offset = 100;
	var _day_end_x = obj_game_manager.camera_x - _day_end_x_offset;
	var _day_end_y = obj_game_manager.camera_y - _day_end_y_offset;

	draw_sprite_stretched_ext(
		spr_menu_item_interaction,
		0,
		_day_end_x,
		_day_end_y,
		_day_end_width,
		_day_end_height,
		c_white,
		1
	);
	
	// Orders successful
	var _metrics_offset_x = _day_end_x + 48;
	var _metrics_offset_y = _day_end_y + 16;
	draw_sprite(
		spr_npc_intention_indicator,
		2,
		_metrics_offset_x,
		_metrics_offset_y
	);
	
	draw_text_color(
		_metrics_offset_x + 24,
		_metrics_offset_y + 4,
		$"Happy customers: {obj_player_information_displays.num_orders_succeeded}",
		c_black,
		c_black,
		c_black,
		c_black,
		1
	);
	
	// Orders failed
	draw_sprite(
		spr_npc_intention_indicator,
		1,
		_metrics_offset_x,
		_metrics_offset_y + 40
	);
	
	draw_text_color(
		_metrics_offset_x + 24,
		_metrics_offset_y + 44,
		$"Angry customers: {obj_player_information_displays.num_orders_failed}",
		c_black,
		c_black,
		c_black,
		c_black,
		1
	);
	
	// Money earned
	draw_sprite(
		spr_money,
		1,
		_metrics_offset_x + 4,
		_metrics_offset_y + 84
	);
	
	draw_text_color(
		_metrics_offset_x + 24,
		_metrics_offset_y + 84,
		$"Money earned: {obj_player_information_displays.money_earned_today}",
		c_black,
		c_black,
		c_black,
		c_black,
		1
	);
	
	// End day button
	var _end_day_button_x = _day_end_x + 90;
	var _end_day_button_y = _day_end_y + 164;
	
	var _end_day_index = 0;
	if point_in_rectangle(
		mouse_x,
		mouse_y,
		_end_day_button_x,
		_end_day_button_y,
		_end_day_button_x + 112,
		_end_day_button_y + 24
	) {
		_end_day_index = 1;
		
		// Actually end the day if the player clicks it
		if mouse_check_button_pressed(mb_left) {
			progress_to_next_day();
		}
	}
	
	
	draw_sprite(
		spr_end_day,
		_end_day_index,
		_end_day_button_x,
		_end_day_button_y
	);
}


function progress_to_next_day() {
	// Game manager
	obj_game_manager.in_game_day += 1;
	obj_game_manager.day_current_time = obj_game_manager.day_length_time;
	obj_game_manager.day_has_ended = false;
	
	// Ensure all NPCs are gone
	if instance_exists(obj_npcs) {
		instance_destroy(obj_npcs);
	}
	
	// Go to the end of day room
	room_goto(rm_end_of_day);
}

