/// @description



cook_order_queue_x = obj_game_manager.camera_x + 164;
cook_order_queue_y = obj_game_manager.camera_y - 128;


current_money_x = obj_game_manager.camera_x - 228;
current_money_y = obj_game_manager.camera_y - 128;


// Money thingys
// TODO: Move to function
draw_sprite(
	spr_money,
	0,
	current_money_x,
	current_money_y
);

// TODO: Move to scribble once I get that added
draw_text(
	current_money_x + 22,
	current_money_y - 2,
	current_money
);



draw_cook_queue();



