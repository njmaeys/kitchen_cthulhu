/// @description

if obj_game_manager.game_paused {
	return;
}

// If the dining area is not open then just kick out
if not dining_is_open {
	return;
}


// If dining is open and day is not over then countodwn the day
if obj_game_manager.day_current_time > 0 {
	obj_game_manager.day_current_time -= 1;
}
else {
	// TODO: Have a function to send all NPCs home.
	// This will NOT count against or for the player they just leave
	dining_is_open = false;
	
	// Clear the cooking queue
	dining_currently = [];
	
	// Send all NPCs out the door
	obj_npcs.can_roam = false;
	obj_npcs.can_leave = true;
}


npc_spawn_in_dining_area();



