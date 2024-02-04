/// @description



// Money thingys
current_money_x = obj_game_manager.camera_x - 228;
current_money_y = obj_game_manager.camera_y - 128;
draw_money_displays();


// Day timer
// TODO: Move to function
day_timer_x = obj_game_manager.camera_x;
day_timer_y = obj_game_manager.camera_y - 132;
draw_sprite(
	spr_day_timer,
	0,
	day_timer_x,
	day_timer_y
);

	
var _day_progress_percentage = interaction_progress(obj_game_manager.day_length_time, obj_game_manager.day_current_time);

var _max_progress_indicator_width = 200; // It's 200 -2 for border
var _progress_val = _max_progress_indicator_width * (_day_progress_percentage / 100);
var _progress_bar_increase_width = floor(_progress_val);
var _day_timer_offset_x = day_timer_x - 100;
var _day_timer_offset_y = day_timer_y + 9;
draw_sprite_stretched(
	spr_progress_meter_day,
	0,
	_day_timer_offset_x,
	_day_timer_offset_y,
	_progress_bar_increase_width,
	5
);


// Cook queue
cook_order_queue_x = obj_game_manager.camera_x + 164;
cook_order_queue_y = obj_game_manager.camera_y - 128;
draw_cook_queue();



