
function npc_burger_collison_box() {
	var _x_left =  x - 8; 
	var _x_right = x + 8;
	var _y_bottom = y;
	var _y_top = y - 32;
	
	return [_x_left, _y_top, _x_right, _y_bottom]
}

function npc_burger_hit_customer(_burger_left, _burger_top, _burger_right, _burger_bottom) {
	// Top left
	if point_in_rectangle(
		_burger_left, 
		_burger_top, 
		burger_collision_box[0],
		burger_collision_box[1],
		burger_collision_box[2],
		burger_collision_box[3]
	) { return true; }
	
	// Top right
	if point_in_rectangle(
		_burger_right, 
		_burger_top, 
		burger_collision_box[0],
		burger_collision_box[1],
		burger_collision_box[2],
		burger_collision_box[3]
	) { return true; }
	
	// Bottom left
	if point_in_rectangle(
		_burger_left, 
		_burger_bottom, 
		burger_collision_box[0],
		burger_collision_box[1],
		burger_collision_box[2],
		burger_collision_box[3]
	) { return true; }
	
	// Bottom right
	if point_in_rectangle(
		_burger_right, 
		_burger_bottom, 
		burger_collision_box[0],
		burger_collision_box[1],
		burger_collision_box[2],
		burger_collision_box[3]
	) { return true; }
	

	return false
}

function burger_order_collision_verification() {
	for (var _i = 0; _i < array_length(obj_dining_room_manager.dining_currently); _i += 1) {
		var _item = obj_dining_room_manager.dining_currently[_i];
	
		if _item == id {
			var _remove_index = _i;
		
			if order_matches_delivered(currently_plated, obj_burger_toss.currently_plated) {
				order_successful = true;
				obj_player_information_displays.num_orders_succeeded += 1;
				obj_game_manager.current_money += order_cost;
				obj_player_information_displays.money_earned_today += order_cost;
			}
			else {
				order_successful = false;
				obj_player_information_displays.num_orders_failed += 1;
			}
		
			// Regardless of order outcome remove the item from the dining list
			array_delete(
				obj_dining_room_manager.dining_currently,
				_i,
				1
			);

			break;
		}
	}
}



