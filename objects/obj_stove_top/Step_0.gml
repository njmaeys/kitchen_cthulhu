/// @description

mouse_hovering = mouse_hovering_object();
player_nearby = close_to_player();

if current_cook_slots == -1 {
	stove_top_set_current_level_attributres();
}

// TODO: Move this to a function
if player_nearby
	and obj_player.currently_carrying != -1
	and obj_player.currently_carrying.needs_cooked
{
	show_debug_message(current_cook_slots);
	for (var _i = 0; _i < current_cook_slots; _i += 1) {
		show_debug_message("Player nearby and holding something to cook");
	}
}



// Depth sort
depth_sort();
