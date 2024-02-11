/// @description 


draw_self();



// Stove item management
var _slot_x_offset_pickup = x + 8;
var _slot_y_offset_pickup = y - 59;
stove_take_item(_slot_x_offset_pickup, _slot_y_offset_pickup);

var _slot_x_offset = x + 8;
var _slot_y_offset = y - 59;
stove_place_item(_slot_x_offset, _slot_y_offset);

// Sound of cooking
// TODO: Make it's sound drop off by distance
play_cook_burger_sound()




