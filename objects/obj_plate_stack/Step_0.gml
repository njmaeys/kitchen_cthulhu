/// @description

// Mouse checks
mouse_hovering = mouse_hovering_object();

// Player checks
player_nearby = close_to_player();



// TODO: Move logic to functions
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
	
	// TODO: Manage the values for the max and currently carrying
	// This will need to dictate the sprite index
	image_index = current_max - current_num;
}





depth_sort();


