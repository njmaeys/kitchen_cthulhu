/// @description 

depth = obj_game_manager.depth_menus;

draw_self();


// Raise and lower the alpha
if fade_state == 0 {
	if current_fade_duration < fade_duration_max {
		current_fade_duration += 1;
	}
	else {
		fade_state = 1;
		room_goto(target_room);
	}
}
else {
	current_fade_duration -= 1;
	if current_fade_duration <= 0 {
		instance_destroy();
	}
}

alpha = current_fade_duration / fade_duration_max;


image_alpha = alpha;





