/// @description 

// Mouse
_x1 = x;
_y1 = y - 32;
_x2 = x + 32;
_y2 = y;
mouse_hovering = false;



// Player
can_use = true;
look_distance = 32;
player_nearby = false;


// Check if there is currently something on it
currently_holding = -1;
plate_inst = -1; // If it is holding a plate we need to know the inst of that one


// Chop timer - Track how long it has left to be chopped.
// If the item get's picked up it resets
chop_timer = -1;
chop_progress_percentage = 0;
currently_chopping = false;
control_chop_sound = false;

