/// @description 


/*
########################## NOTES ######################

// Obj orientation
(clock starting at 6 ... down)
0 = down
1 = left
2 = up
3 = right

*/

// Find the center of the camera view so I can easily set where to draw menus.
// NOTE: Keep the camera consistent of this will be a pain
camera_x = -1;
camera_y = -1;


// Depth trackers
depth_menu_interactions = -10000;
depth_dialogue_boxes = -20000;
depth_deliverables = -30000;
depth_menus = -60000; // Make sure this is always the top most depth drawn

fullscreen = false;

// Pause menu
game_paused = false;
pause_x_offset = 150;
pause_y_offset = 100;
pause_width = 300;
pause_height = 200;


// Day settings
one_min_len = 60 * 60; // 1 min (60 fps * 60 == 1 min)
in_game_day = 1; // Increase this at the "close" of every day
day_length_time = one_min_len * 0.1; // 3 min each day
day_current_time = day_length_time; // Reset this each day
day_has_ended = false;


// Money tracking
current_money = 0;
current_cthulhu_money = 0;


// For drawing the menus this depth needs to be the menu depth
depth = depth_menus;
