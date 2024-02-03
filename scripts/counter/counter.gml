function counter_place_item() {
	// If the player is holding a plate and there is an item on the counter
	// put the item on the plate
	if currently_holding != -1 
		and obj_player.plate_inst != -1
		and currently_holding.name != "plate"
		and (obj_player.plate_inst.has_items or obj_player.plate_inst.is_clean)
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		plate_item_from_counter(currently_holding.name);
		currently_holding = -1;
		return;
	}
	
	// Take an item that the player is holding and place it on the counter
	if currently_holding == -1 
		and obj_player.currently_carrying != -1
		and player_nearby
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		currently_holding = obj_player.currently_carrying;
		if currently_holding.needs_chopped {
			chop_timer = obj_player.currently_carrying.chop_time;
		}
		
		if currently_holding.name == "plate" {
			plate_inst = obj_player.plate_inst;
			obj_player.plate_inst = -1;
			
			plate_inst.is_being_carried = false;
			plate_inst.is_on_counter = true;
			plate_inst.depth = self.depth - 1;
		}
		
		obj_player.currently_carrying = -1;
	}
	
	// Plate items if there is a plate and the player has something to plate
	if plate_inst != -1 
		and (plate_inst.is_clean or plate_inst.has_items)
		and obj_player.currently_carrying != -1
		and player_nearby
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		switch obj_player.currently_carrying.name {
			case "burger_bun":
				// This one is a bit different than the rest. It sets two items at once burger_bun_bottom and burger_bun_top
				if plate_inst.currently_plated.burger_bun_top != -1 {
					return;
				}
			
				plate_inst.currently_plated.burger_bun_bottom = obj_ingredient_manager.all_ingredients.burger_bun_bottom;
				plate_inst.currently_plated.burger_bun_top = obj_ingredient_manager.all_ingredients.burger_bun_top;
				plate_inst.is_clean = false;
				obj_player.currently_carrying = -1;
				return;
				
			case "burger_cooked":
				if plate_inst.currently_plated.burger_cooked != -1 {
					return;
				}
			
				plate_inst.currently_plated.burger_cooked = obj_ingredient_manager.all_ingredients.burger_cooked;
				plate_inst.is_clean = false;
				obj_player.currently_carrying = -1;
				return;
				
			case "tomato_chopped":
				if plate_inst.currently_plated.tomato_chopped != -1 {
					return;
				}
				
				plate_inst.currently_plated.tomato_chopped = obj_ingredient_manager.all_ingredients.tomato_chopped;
				plate_inst.is_clean = false;
				obj_player.currently_carrying = -1;
				return;
				
			case "cheese_chopped":
				if plate_inst.currently_plated.cheese_chopped != -1 {
					return;
				}
				
				plate_inst.currently_plated.cheese_chopped = obj_ingredient_manager.all_ingredients.cheese_chopped;
				plate_inst.is_clean = false;
				obj_player.currently_carrying = -1;
				return;
				
			case "lettuce_chopped":
				if plate_inst.currently_plated.lettuce_chopped != -1 {
					return;
				}
				
				plate_inst.currently_plated.lettuce_chopped = obj_ingredient_manager.all_ingredients.lettuce_chopped;
				plate_inst.is_clean = false;
				obj_player.currently_carrying = -1;
				return;
		}
	}
	
	return;
}


function counter_take_item() {
	// If there is a selection obj open then return out
	if instance_exists(obj_item_interaction_menu) {
		return;
	}
	
	// Take an item that the player is holding and place it on the counter
	if currently_holding != -1 
		and obj_player.currently_carrying == -1
		and player_nearby
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		obj_player.currently_carrying = currently_holding;
		
		if currently_holding.name == "plate" {
			obj_player.plate_inst = plate_inst;
			obj_player.plate_inst.depth = obj_game_manager.depth_deliverables;
			plate_inst = -1;
			
			obj_player.plate_inst.is_being_carried = true;
			obj_player.plate_inst.is_on_counter = false;
		}
		
		currently_holding = -1;
		chop_timer = -1;
		chop_progress_percentage = 0;
	}
	
	return;
}


function counter_chop_item() {
	// Ensure there is an item to chop and the player isn't holding something
	if chop_timer == -1 {
		return;
	}
	
	if obj_game_manager.game_paused {
		// If the game is paused the timer should halt
		return;
	}
	
	if chop_timer > 0 {
		if currently_holding != -1 
			and obj_player.currently_carrying == -1
			and player_nearby
			and mouse_hovering
			and mouse_check_button(mb_right)
		{
			currently_chopping = true;
			chop_timer -= 1;
			
			chop_progress_percentage = interaction_progress(currently_holding.chop_time, chop_timer);
		}
		else {
			currently_chopping = false;
		}
		return;
	}
	
	// Set the relative chopped item
	currently_chopping = false;
	
	switch currently_holding.name {
		case "tomato":
			currently_holding = obj_ingredient_manager.all_ingredients.tomato_chopped;
			chop_timer = -1;
			return;
			
		case "cheese":
			currently_holding = obj_ingredient_manager.all_ingredients.cheese_chopped;
			chop_timer = -1;
			return;
			
		case "lettuce":
			currently_holding = obj_ingredient_manager.all_ingredients.lettuce_chopped;
			chop_timer = -1;
			return;
	}
}

function plate_item_from_counter(_item_name) {
	switch _item_name {
		case "burger_bun":
			// This one is a bit different than the rest. It sets two items at once burger_bun_bottom and burger_bun_top
			if obj_player.plate_inst.currently_plated.burger_bun_top != -1 {
				return;
			}
			
			obj_player.plate_inst.currently_plated.burger_bun_bottom = obj_ingredient_manager.all_ingredients.burger_bun_bottom;
			obj_player.plate_inst.currently_plated.burger_bun_top = obj_ingredient_manager.all_ingredients.burger_bun_top;
			obj_player.plate_inst.is_clean = false;
			return;
				
		case "burger_cooked":
			if obj_player.plate_inst.currently_plated.burger_cooked != -1 {
				return;
			}
			
			obj_player.plate_inst.currently_plated.burger_cooked = obj_ingredient_manager.all_ingredients.burger_cooked;
			obj_player.plate_inst.is_clean = false;
			return;
				
		case "tomato_chopped":
			if obj_player.plate_inst.currently_plated.tomato_chopped != -1 {
				return;
			}
				
			obj_player.plate_inst.currently_plated.tomato_chopped = obj_ingredient_manager.all_ingredients.tomato_chopped;
			obj_player.plate_inst.is_clean = false;
			return;
				
		case "cheese_chopped":
			if obj_player.plate_inst.currently_plated.cheese_chopped != -1 {
				return;
			}
				
			obj_player.plate_inst.currently_plated.cheese_chopped = obj_ingredient_manager.all_ingredients.cheese_chopped;
			obj_player.plate_inst.is_clean = false;
			return;
				
		case "lettuce_chopped":
			if obj_player.plate_inst.currently_plated.lettuce_chopped != -1 {
				return;
			}
				
			obj_player.plate_inst.currently_plated.lettuce_chopped = obj_ingredient_manager.all_ingredients.lettuce_chopped;
			obj_player.plate_inst.is_clean = false;
			return;
	}
}