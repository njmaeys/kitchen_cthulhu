function counter_place_item() {
	// Take an item that the player is holding and place it on the counter
	if currently_holding == -1 
		and obj_player.currently_carrying != -1
		and player_nearby
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		currently_holding = obj_player.currently_carrying;
		if obj_player.currently_carrying.needs_chopped {
			chop_timer = obj_player.currently_carrying.chop_time;
		}
		
		obj_player.currently_carrying = -1;
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
		}
		else {
			currently_chopping = false;
			if instance_exists(obj_chop_overlay) {
				instance_destroy(obj_chop_overlay);
			}
		}
		return;
	}
	
	// Set the relative chopped item
	currently_chopping = false;
	if instance_exists(obj_chop_overlay) {
		instance_destroy(obj_chop_overlay);
	}
	
	switch currently_holding.name {
		case "tomato":
			currently_holding = obj_ingredient_manager.all_ingredients.tomato_chopped;
			chop_timer = -1;
			return;
	}
}