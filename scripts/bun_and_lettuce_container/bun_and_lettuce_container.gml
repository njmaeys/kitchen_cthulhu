function bun_and_lettuce_take_item() {
	if obj_player.currently_carrying == -1 {
		// Allow the player to pick something up if they have nothing
		if mouse_hovering == 1
			and player_nearby == 1
		{
			if mouse_check_button_pressed(mb_left) {
				draw_ingredients_selection = true;
			}
		}
	}
	
	// If the player already has something they cannot get another thing
	return;
}

function bun_and_lettuce_draw_selections() {
	var _x_offset = x + 6;
	var _y_offset = y + 4;
	
	for (var _i = 0; _i < array_length(obj_bun_and_lettuce_container.current_ingredients); _i += 1) {
		var _item = obj_bun_and_lettuce_container.current_ingredients[_i]
	
		/*
		NOTE: The size of the container sprite is 24x24. This means
		I can just grab that as the bounding box for a point in rectangle
		*/

		// Use this for the mouse action and hover index as well
		var _mouse_hovering = point_in_rectangle(
			mouse_x,
			mouse_y,
			_x_offset,
			_y_offset,
			_x_offset + 24,
			_y_offset + 24
		);
		
		var _hover_index = 0;
		if _mouse_hovering {
			_hover_index = 1;
			
			if mouse_check_button_pressed(mb_left) 
				and obj_bun_and_lettuce_container.can_click_ingredient_cooldown == 0
			{
				// If player clicks check if the item can be given to them or not
				bun_and_lettuce_give_item_to_player(_item.name);
			}
		}
		
		// Container
		draw_sprite(
			spr_menu_item_container,
			_hover_index,
			_x_offset,
			_y_offset
		);
	
		// Actual item
		draw_sprite(
			_item.spr,
			0,
			_x_offset + 4,
			_y_offset + 4
		);

		// Increase the starting placement of the containers
		_x_offset += 30;
	}
}


function bun_and_lettuce_give_item_to_player(_item_name) {
	// Immediately exit if the player is already holding something.
	// Let them figure out they are holding something already
	if obj_player.currently_carrying != -1 {
		return;
	}
	
	switch _item_name {
		case "burger_bun":
			obj_player.currently_carrying = obj_ingredient_manager.all_ingredients.burger_bun;
			break;
			
		case "lettuce":
			obj_player.currently_carrying = obj_ingredient_manager.all_ingredients.lettuce;
			break;
	}
	
	instance_destroy(obj_item_interaction_menu);
	obj_bun_and_lettuce_container.draw_ingredients_selection = false;
}