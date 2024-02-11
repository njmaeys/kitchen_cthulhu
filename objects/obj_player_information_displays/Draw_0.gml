/// @description



// Money thingys
current_money_x = obj_game_manager.camera_x - 228;
current_money_y = obj_game_manager.camera_y - 128;
draw_money_displays();


// Day timer
day_timer_x = obj_game_manager.camera_x;
day_timer_y = obj_game_manager.camera_y - 132;
draw_day_timer();


// Cook queue
cook_order_queue_x = obj_game_manager.camera_x + 164;
cook_order_queue_y = obj_game_manager.camera_y - 128;
draw_cook_queue();


// Fear meter
current_fear_x = obj_game_manager.camera_x - 228;
current_fear_y = obj_game_manager.camera_y + 88;
//draw_fear_displays();
