/// @description



// If the dining area is not open then just kick out
if not dining_is_open {
	return;
}


var _dining_count = array_length(dining_currently);
if _dining_count < dining_max 
	and spawn_diner_cooldown_current == 0
{
	show_debug_message("\n### Spanw New Diner ####");
	show_debug_message(dining_currently);
	// Spawn a diner
	spawn_diner_cooldown_current = spawn_diner_cooldown_max;
	instance_create_depth(
		start_x,
		start_y,
		obj_door_main.depth - 1,
		obj_npcs
	);
}
else {
	spawn_diner_cooldown_current -= 1;
	show_debug_message($"Diner cooldown: {spawn_diner_cooldown_current}");
}



