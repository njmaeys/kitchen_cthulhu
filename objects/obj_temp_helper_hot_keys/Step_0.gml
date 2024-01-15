/// @description

// HELPER FUNCTIONS TO HOT KEY THINGS



// Delete the current item held
if keyboard_check_pressed(ord("L")) {
	obj_player.currently_carrying = -1;
}

// Give myself some cheese
if keyboard_check_pressed(ord("C")) {
	obj_player.currently_carrying = obj_ingredient_manager.all_ingredients.cheese;
}

// Give myself some burger
if keyboard_check_pressed(ord("B")) {
	obj_player.currently_carrying = obj_ingredient_manager.all_ingredients.burger;
}

// Full screen
if keyboard_check_pressed(ord("F")) {
	obj_game_manager.fullscreen = !obj_game_manager.fullscreen;
	window_set_fullscreen(obj_game_manager.fullscreen);
}