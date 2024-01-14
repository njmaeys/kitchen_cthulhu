/// @description


// Mouse checks
mouse_hovering = mouse_hovering_location(_x1, _y1, _x2, _y2);


// Player checks
player_nearby = close_to_player();
if currently_holding == -1 {
	counter_place_item();
}
else {
	counter_take_item();
	counter_chop_item();
}


// Depth sort
depth_sort();


