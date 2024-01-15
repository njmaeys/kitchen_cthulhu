/// @description


// Mouse checks
mouse_hovering = mouse_hovering_object();

// Set the ingredients
if current_ingredients == -1 {
	current_ingredients = [
		obj_ingredient_manager.all_ingredients.cheese,
		obj_ingredient_manager.all_ingredients.tomato,
		obj_ingredient_manager.all_ingredients.burger,
	]
}

// If the click cooldown is not yet 0 then drop it down
if can_click_ingredient_cooldown > 0 {
	can_click_ingredient_cooldown -= 1;
}

// Player checks
player_nearby = close_to_player();
fridge_take_item();

// If the player walks away just close the pop up
if !player_nearby 
	and draw_ingredients_selection 
{
	draw_ingredients_selection = false;
	if instance_exists(obj_item_interaction_menu) {
		instance_destroy(obj_item_interaction_menu);
	}
}


// Depth sort
depth_sort();


