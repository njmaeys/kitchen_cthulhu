/// @description

currently_plated = copy_struct(obj_player.plate_inst.currently_plated);
has_items = false;

// Create Event of the burger object
move_speed = 4; // Set the movement speed

// Get the starting position
start_x = x;
start_y = y;

// Calculate the direction towards the mouse position
direction_to_mouse = point_direction(start_x, start_y, mouse_x, mouse_y);

// Calculate the initial movement components
move_x = lengthdir_x(move_speed, direction_to_mouse);
move_y = lengthdir_y(move_speed, direction_to_mouse);
