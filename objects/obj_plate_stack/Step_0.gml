/// @description

// Mouse checks
mouse_hovering = mouse_hovering_object();

// Player checks
player_nearby = close_to_player();

// Manage the plate number in the stack
image_index = current_max - current_num;

// Place and remove plates
if obj_player.currently_carrying == -1 {
	plate_stack_take_plate();
}
else {
	plate_stack_return_plate();
}



depth_sort();


