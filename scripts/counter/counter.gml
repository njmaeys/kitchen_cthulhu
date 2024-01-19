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
		
		obj_player.currently_carrying = -1;
		
		if currently_holding.name == "plate" {
			plate_inst = obj_player.plate_inst;
			obj_player.plate_inst = -1;
			
			plate_inst.is_being_carried = false;
			plate_inst.is_on_counter = true;
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