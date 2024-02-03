/// @description 


// Dining area
dining_is_open = false;
dining_max = 4; // Don't spawn more than this many customers at least yet
dining_currently = [];
spawn_diner_cooldown_max = 1800; // Start with 30 sec (1800) and see how it goes
spawn_diner_cooldown_current = 300; // Start at 5 sec and then let max take it from there
start_x = path_get_point_x(pth_enter, 0);
start_y = path_get_point_y(pth_enter, 0);
leave_x = obj_exit_spot.x;
leave_y = obj_exit_spot.y;


