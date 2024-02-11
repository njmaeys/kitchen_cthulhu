function stove_top_set_current_level_attributres() {
	/*
	Use this and similar functions like this to manage attributes based on the level
	of the item.
	*/

	switch obj_stove_top.current_level {
		case 1:
			obj_stove_top.current_cook_slots = 2;
			
			// Initialize the stove top as an empty array and so we know the items to expect
			obj_stove_top.currently_holding = []
			
			for (var _i = 0; _i < obj_stove_top.current_cook_slots; _i += 1) {
				obj_stove_top.currently_holding[_i] = -1;
				obj_stove_top.currently_holding_cooking_timers[_i] = 0;
				obj_stove_top.currently_holding_burning_timers[_i] = 0;
			}
			return;
	}
}

function stove_place_item(_slot_x_offset, _slot_y_offset) {
	var _progress_offset = 40;
	
	for (var _i = 0; _i < array_length(currently_holding); _i += 1) {
		var _slot = currently_holding[_i]
		
		if just_placed_item_cooldown > 0 {
			// The stupid cooldown thing for clicking over something already being clicked
			just_placed_item_cooldown -= 1;
			_slot_y_offset += 20;
			continue;
		}
		
		var _w = 18;
		var _h = 18;
		var _slot_index = 0;
		var _mouse_on_slot = point_in_rectangle(
			mouse_x,
			mouse_y,
			_slot_x_offset,
			_slot_y_offset,
			_slot_x_offset + _w,
			_slot_y_offset + _h
		);
		
		if _mouse_on_slot {
			_slot_index = 1;
			
			// If the player uses the interactive slot then take the item from them
			// and put it on the stove, just like the counter mechanics
			if mouse_check_button_pressed(mb_left) 
				and _slot == -1
				and obj_player.currently_carrying != -1
				and obj_player.currently_carrying.needs_cooked
				and just_placed_item_cooldown == 0
			{
				currently_holding[_i] = obj_player.currently_carrying;
				currently_holding_cooking_timers[_i] = currently_holding[_i].cook_time;
				currently_holding_burning_timers[_i] = 0;
		
				obj_player.currently_carrying = -1;
				just_placed_item_cooldown = 5;
			}
		}
		
		if _slot == -1 
			and player_nearby
			and obj_player.currently_carrying != -1
			and obj_player.currently_carrying.needs_cooked
		{
			draw_sprite_stretched(
				spr_menu_item_container,
				_slot_index,
				_slot_x_offset,
				_slot_y_offset,
				_w,
				_w
			);
		} 
		
		if _slot != -1 {
			draw_sprite_stretched(
				currently_holding[_i].spr,
				_slot_index,
				_slot_x_offset,
				_slot_y_offset,
				_w,
				_w
			);
			
			if currently_holding[_i].cook_time > 0 {
				currently_cooking_something = true;
				stove_cook_item(_i);
				if currently_holding_cooking_timers[_i] > 0 {
					var _cook_progress_percentage = interaction_progress(currently_holding[_i].cook_time, currently_holding_cooking_timers[_i]);
					draw_progress_meeter(_cook_progress_percentage, _slot_x_offset-8, _slot_y_offset, 2, spr_progress_meter);
				}
			}

			if currently_holding[_i].burn_time > 0 {
				stove_burn_item(_i);
				if currently_holding_burning_timers[_i] > 0 {
					var _burn_progress_percentage = interaction_progress(currently_holding[_i].burn_time, currently_holding_burning_timers[_i]);
					draw_progress_meeter(_burn_progress_percentage, _slot_x_offset-8, _slot_y_offset, 2, spr_progress_meter_danger);
				}
			}
		}
		
		_slot_y_offset += 20;
	}
}


function stove_take_item(_slot_x_offset_pickup, _slot_y_offset_pickup) {
	for (var _i = 0; _i < array_length(currently_holding); _i += 1) {
		var _cooking_slot = currently_holding[_i]
	
		if _cooking_slot == -1 {
			// Just immediately continue to next loop if the slot has nothing in it
			_slot_y_offset_pickup += 20;
			continue;
		}
	
		if just_placed_item_cooldown > 0 {
			// The stupid cooldown thing for clicking over something already being clicked
			just_placed_item_cooldown -= 1;
			_slot_y_offset_pickup += 20;
			continue;
		}

		var _w = 18;
		var _h = 18;
		var _slot_index_pickup = 0;
		var _mouse_on_slot = point_in_rectangle(
			mouse_x,
			mouse_y,
			_slot_x_offset_pickup,
			_slot_y_offset_pickup,
			_slot_x_offset_pickup + _w,
			_slot_y_offset_pickup + _h
		);
		
		if _mouse_on_slot {
			_slot_index_pickup = 1;
			
			// If the player uses the interactive slot the stove top
			if mouse_check_button_pressed(mb_left) 
				and just_placed_item_cooldown == 0 // Account for the damn quick click thing with the mouse
			{
				if obj_player.currently_carrying == -1 {
					obj_player.currently_carrying = currently_holding[_i];
					currently_holding[_i] = -1;
					just_placed_item_cooldown = 5;
					break;
				}
				
				if obj_player.plate_inst != -1
					and (obj_player.plate_inst.has_items or obj_player.plate_inst.is_clean)
					and currently_holding[_i].name == "burger_cooked"
				{
					plate_item_from_counter(currently_holding[_i].name);
					currently_holding[_i] = -1;
					just_placed_item_cooldown = 5;
					break;
				}
			}
		}
	
		if player_nearby 
			and obj_player.currently_carrying = -1
		{
			draw_sprite_stretched(
				spr_menu_item_container,
				_slot_index_pickup,
				_slot_x_offset_pickup,
				_slot_y_offset_pickup,
				_w,
				_w
			);
		}
	
		_slot_y_offset_pickup += 20;
	}
}


function stove_cook_item(_index) {
	if obj_game_manager.game_paused {
		// If the game is paused the timer should halt
		return;
	}
	
	if currently_holding_cooking_timers[_index] > 0 {
		currently_holding_cooking_timers[_index] -= 1;
		return;
	}

	
	if currently_holding_cooking_timers[_index] <= 0 {
		switch currently_holding[_index].name {
			case "burger":
				currently_holding[_index] = obj_ingredient_manager.all_ingredients.burger_cooked;
		}
	}
	
	// Set the burning timer
	if currently_holding_burning_timers[_index] <= 0 {
		currently_holding_burning_timers[_index] = currently_holding[_index].burn_time;
	}
	
	
}

function stove_burn_item(_index) {
	if obj_game_manager.game_paused {
		// If the game is paused the timer should halt
		return;
	}
	
	if currently_holding_burning_timers[_index] > 0 {
		currently_holding_burning_timers[_index] -= 1;
		return;
	}

	
	if currently_holding_burning_timers[_index] <= 0 {
		switch currently_holding[_index].name {
			case "burger_cooked":
				currently_holding[_index] = obj_ingredient_manager.all_ingredients.burger_burnt;
		}
	}
}


function play_cook_burger_sound() {
	currently_cooking_something = false;
	
	var _max_dist_away = 256;
	var _snd_multiplier_dist = distance_to_object(obj_player);
	if _snd_multiplier_dist > _max_dist_away {
		_snd_multiplier_dist = _max_dist_away;
	}
	var _snd_multiplier = (_max_dist_away - _snd_multiplier_dist) / _max_dist_away
	
	for (var _i = 0; _i < array_length(currently_holding); _i += 1) {
		var _slot = currently_holding[_i]
		if _slot == -1 {
			continue;
		}
	
		if currently_holding[_i].cook_time > 0 
			or currently_holding[_i].burn_time > 0
		{
			currently_cooking_something = true;
			break;
		}
	}
	if currently_cooking_something {
		if not audio_is_playing(snd_burger_cook) {
			audio_play_sound(
				snd_burger_cook,
				1,
				true,
				cooking_sound_gain * _snd_multiplier
			);
		}
		audio_sound_gain(
			snd_burger_cook,
			cooking_sound_gain * _snd_multiplier,
			0
		);
	}
	else {
		if audio_is_playing(snd_burger_cook) {
			audio_stop_sound(snd_burger_cook);
		}
	}
}

