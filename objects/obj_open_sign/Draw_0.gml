/// @description


draw_self();



// TODO: Move to function
if player_nearby
	and mouse_hovering
	and not obj_dining_room_manager.dining_is_open 
{
	// NOTE: Once the player starts the day they have to progress through. 
	// Only the end of the day can shut down the dining room
	if mouse_check_button_pressed(mb_left) {
		// TODO: Have this also flip the sprite to the open sign on
		obj_dining_room_manager.dining_is_open = true;
	}
}



