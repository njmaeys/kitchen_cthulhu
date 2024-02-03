/// @description


// Mouse checks
mouse_hovering = mouse_hovering_object();

// Player checks
player_nearby = close_to_player();


// Check if the dining room is open
if obj_dining_room_manager.dining_is_open {
	image_index = 1;
}
else {
	image_index = 0;
}



depth_sort();