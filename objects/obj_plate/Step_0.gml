/// @description



if is_being_carried {
	x = obj_player.x;
	y = obj_player.y - 16;
	
	depth = obj_game_manager.depth_deliverables;
	
	// Throw the burger off the plate and set it to dirty
	if keyboard_check_pressed(ord("F")) {
		throw_burger();
	}
}

// Set's the dirty dish sprite
if not is_clean 
	and not has_items
{
	// Only show the dirty plate if it is dirty and does NOT have items
	image_index = 1; 
}
else {
	image_index = 0;
}