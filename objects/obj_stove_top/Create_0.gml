/// @description

// Initialize attributes
current_level = 1;
current_cook_slots = -1;
currently_holding = -1;
// TODO: Now that I have the util function for struct copying
// this should be refactored to utilize that instead of managing
// another set of data structures
currently_holding_cooking_timers = -1;
currently_holding_burning_timers = -1;


mouse_hovering = false;


// Player
look_distance = 32;
player_nearby = false;

// Place and pick up vars
just_placed_item_cooldown = 0;

