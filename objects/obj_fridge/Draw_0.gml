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


// Reflection
randomize();
// TODO: Make it only show up sometimes
if obj_game_manager.fear_current != 0
	and player_nearby
{
	
	if randomize_fear_reflection {
		randomize_fear_reflection = false;
		if irandom_range(0, 5) >= 3 {
			draw_fear_reflection = true;
		}
	}
	
	if draw_fear_reflection {
		draw_sprite_ext(
			spr_cthulhu_icon_fear_progress,
			0,
			x + 16,
			y + 24,
			1,
			1,
			0,
			c_white,
			obj_game_manager.fear_current / obj_game_manager.fear_max
		);
	}
}
else {
	randomize_fear_reflection = true;
	draw_fear_reflection = false;
}



