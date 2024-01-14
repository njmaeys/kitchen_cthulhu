function fridge_take_item() {
	if obj_player.currently_carrying == -1 {
		// Allow the player to pick something up if they have nothing
		if mouse_hovering == 1
			and player_nearby == 1
		{
			if mouse_check_button_pressed(mb_left) {
				// TODO: Make this not a hard coded tomato
				obj_player.currently_carrying = obj_ingredient_manager.all_ingredients.tomato;
			}
		}
	}
	
	// If the player already has something they cannot get another thing
	return;
}