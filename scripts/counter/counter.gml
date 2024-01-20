function counter_place_item() {
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
		and plate_inst.is_clean
		and obj_player.currently_carrying != -1
		and player_nearby
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		switch obj_player.currently_carrying.name {
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
		}
	}
	
	return;
}


function counter_take_item() {
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
	
	if chop_timer > 0 {
		if currently_holding != -1 
			and obj_player.currently_carrying == -1
			and player_nearby
			and mouse_hovering
			and mouse_check_button(mb_right)
		{
			currently_chopping = true;
			chop_timer -= 1;
			
			/*
			NOTE TO SELF
			Try and set up an array of the chop timers based on the index of the item 
			in the stove array. This may make it easier
			*/
			
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
	}
}