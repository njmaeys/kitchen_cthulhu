function draw_cook_queue(){
	if array_length(obj_dining_room_manager.dining_currently) > 0 {
	
		for (var _i = 0; _i < array_length(obj_dining_room_manager.dining_currently); _i += 1) {
			var _npc = obj_dining_room_manager.dining_currently[_i]
		
				
			var _queue_item_x = cook_order_queue_x;	

		
			// Draw the container
			draw_sprite_stretched(
				spr_menu_item_interaction,
				0,
				_queue_item_x,
				cook_order_queue_y,
				68,
				20
			);	
			
			// Draw the wait progression of the bar
			draw_sprite_stretched_ext(
				spr_progress_meter_danger,
				0,
				_queue_item_x + 3,
				cook_order_queue_y + 3,
				62 * (_npc.wait_progress_percentage / 100),
				14,
				c_white,
				0.75
			);

			for (var _s = 0; _s < array_length(_npc.queue_display); _s += 1) {
				var _spr = _npc.queue_display[_s];

				// Draw the actual ingredient
				draw_sprite_ext(
					_spr,
					0,
					_queue_item_x + 4,
					cook_order_queue_y + 4,
					0.75,
					0.75,
					0,
					c_white,
					1
				);
				_queue_item_x += 12;
			}
			cook_order_queue_y += 22;
		}
	}
}

function draw_money_displays() {
	draw_sprite(
		spr_money,
		0,
		current_money_x,
		current_money_y
	);

	// TODO: Move to scribble once I get that added
	draw_text(
		current_money_x + 22,
		current_money_y - 2,
		obj_game_manager.current_money
	);
}

function draw_day_timer() {
	draw_sprite(
		spr_day_timer,
		0,
		day_timer_x,
		day_timer_y
	);

	
	var _day_progress_percentage = interaction_progress(obj_game_manager.day_length_time, obj_game_manager.day_current_time);

	var _max_progress_indicator_width = 200; // It's 200 -2 for border
	var _progress_val = _max_progress_indicator_width * (_day_progress_percentage / 100);
	var _progress_bar_increase_width = floor(_progress_val);
	var _day_timer_offset_x = day_timer_x - 100;
	var _day_timer_offset_y = day_timer_y + 9;
	draw_sprite_stretched(
		spr_progress_meter_day,
		0,
		_day_timer_offset_x,
		_day_timer_offset_y,
		_progress_bar_increase_width,
		5
	);
}

function draw_fear_displays() {
	draw_sprite_ext(
		spr_cthulhu_icon_fear_progress,
		0,
		current_fear_x,
		current_fear_y,
		1,
		1,
		0,
		c_white,
		obj_game_manager.fear_current / obj_game_manager.fear_max
	);
}
