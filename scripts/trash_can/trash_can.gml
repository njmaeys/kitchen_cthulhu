function remove_item_from_player_carry(){
	// Delete the current item held
	if player_nearby
		and mouse_hovering
		and obj_player.currently_carrying != -1
		and mouse_check_button_pressed(mb_left)
	{
		if obj_player.currently_carrying.name == "plate" {
			obj_player.plate_inst.currently_plated = copy_struct(obj_ingredient_manager.plateable_items);
			obj_player.plate_inst.has_items = false;
		}
		else {
			obj_player.currently_carrying = -1;
		}
	}
}