/// @description 

// Initial vals for movement
is_moving = false;
vx = 0;
vy = 0;
move_speed = 2;
move_right = 0;
move_left = 0;
move_up = 0;
move_down = 0;
sprite_index_moving = spr_player;
sprite_index_idle = spr_player_idle;

// Track what is being carried
currently_carrying = -1;
plate_inst = -1; // If carrying a plate keep track of the specific inst
currently_carrying_x_scale = 1;