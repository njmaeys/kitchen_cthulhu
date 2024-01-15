function remove_item_from_player_carry(){
	// Delete the current item held
	if player_nearby
		and mouse_hovering
		and mouse_check_button_pressed(mb_left)
	{
		obj_player.currently_carrying = -1;
	}
}