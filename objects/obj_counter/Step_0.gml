/// @description


// Mouse checks
mouse_hovering = mouse_hovering_location(_x1, _y1, _x2, _y2);


// Player checks
player_nearby = close_to_player();
if currently_holding == -1 {
	counter_place_item();
}
else {
	if !currently_chopping {
		counter_take_item();
	}
	counter_chop_item();
	
	if plate_inst != -1 {
		plate_inst.x = self.x + 6;
		plate_inst.y = self.y - 32;
	}
}


// TEMP
if plate_inst != -1 {
	show_debug_message("\n#### HERE ####");
	show_debug_message($"Player depth: {obj_player.depth}");
	show_debug_message($"Counter depth: {self.depth}");
	show_debug_message($"Plate depth: {plate_inst.depth}");
}



// Depth sort
depth_sort();


