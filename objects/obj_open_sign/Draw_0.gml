/// @description


// Draw the lighting
if open_sign_light_source.is_visible {
	draw_light_color_under_obj(open_sign_light_source);
}

draw_self();


// TODO: Move to function
if player_nearby
	and mouse_hovering
	and not obj_dining_room_manager.dining_is_open 
{
	// NOTE: Once the player starts the day they have to progress through. 
	// Only the end of the day can shut down the dining room
	if mouse_check_button_pressed(mb_left) {
		obj_dining_room_manager.dining_is_open = true;
		open_sign_light_source.is_visible = true;
	}
}



