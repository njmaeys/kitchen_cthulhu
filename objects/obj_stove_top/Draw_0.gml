/// @description 


draw_self();


// If the player is nearby and holding a cookable item show the slots to place in
// TODO: Move this to a function
var _slot_x_offset = x + 8;
var _slot_y_offset = y - 59;


for (var _i = 0; _i < array_length(currently_holding); _i += 1) {
	// TODO: All the mouse checks and placement of things
	var _slot = currently_holding[_i]
		
	var _w = 18;
	var _h = 18;
	var _slot_index = 0;
	var _mouse_on_slot = point_in_rectangle(
		mouse_x,
		mouse_y,
		_slot_x_offset,
		_slot_y_offset,
		_slot_x_offset + _w,
		_slot_y_offset + _h
	);
		
	if _mouse_on_slot {
		_slot_index = 1;
			
		// If the player uses the interactive slot then take the item from them
		// and put it on the stove, just like the counter mechanics
		if mouse_check_button_pressed(mb_left) 
			and obj_player.currently_carrying != -1
			and obj_player.currently_carrying.needs_cooked
		{
			currently_holding[_i] = obj_player.currently_carrying;
			currently_holding[_i].cook_time = currently_holding[_i].cook_time;
		
			obj_player.currently_carrying = -1;
		}
	}
		
	if _slot == -1 
		and player_nearby
		and obj_player.currently_carrying != -1
		and obj_player.currently_carrying.needs_cooked
	{
		draw_sprite_stretched(
			spr_menu_item_container,
			_slot_index,
			_slot_x_offset,
			_slot_y_offset,
			_w,
			_w
		);
	} 
		
	if _slot != -1 {
		draw_sprite_stretched(
			currently_holding[_i].spr,
			_slot_index,
			_slot_x_offset,
			_slot_y_offset,
			_w,
			_w
		);
	}
		
	_slot_y_offset += 20;
}





