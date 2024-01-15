/// @description 


draw_self();


// Draw the pop up for ingredients if it's needed
if draw_ingredients_selection {
	var _y_offset = y + 16;
	var _x_offset = x - 16

	if !instance_exists(obj_item_interaction_menu) {
		instance_create_depth(
			_x_offset,
			_y_offset,
			obj_game_manager.depth_menu_interactions,
			obj_item_interaction_menu,
			{
				obj_creation_type: "fridge", // Set it to 3x it's size
			}
		);
		
		can_click_ingredient_cooldown = 5;
	}
}





