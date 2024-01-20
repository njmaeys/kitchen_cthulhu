function plate_stack_take_plate() {
	if player_nearby
		and obj_player.currently_carrying == -1
		and mouse_hovering
		and current_num > 0
		and mouse_check_button_pressed(mb_left)
	{
		current_num -= 1;
	
		obj_player.currently_carrying = obj_ingredient_manager.all_ingredients.plate;
	
		// Spawn a plate instance on the player
		var _inst = instance_create_depth(
			obj_player.x,
			obj_player.y - 16,
			obj_game_manager.depth_deliverables,
			obj_plate
		);
		
	
		_inst.is_being_carried = true;
		obj_player.plate_inst = _inst;
	}
}

function plate_stack_return_plate() {
	if player_nearby
		and obj_player.currently_carrying != -1
		and obj_player.plate_inst != -1
		and obj_player.plate_inst.is_clean
		and mouse_hovering
		and current_num < current_max
		and mouse_check_button_pressed(mb_left)
	{
		current_num += 1;
	
		obj_player.currently_carrying = -1;
		
		instance_destroy(obj_player.plate_inst);
		obj_player.plate_inst = -1;
	}
}