/// @description 

if not obj_dining_room_manager.dining_is_open {
	return;
}


// If it hits an NPC then destroy it and do checks if the burger was correct or not
for (var _i = 0; _i < array_length(obj_dining_room_manager.dining_currently); _i += 1) {
	var _item = obj_dining_room_manager.dining_currently[_i];
	
	if _item == other.id {
		var _remove_index = _i;
		
		if order_matches_delivered(other.currently_plated, currently_plated) {
			other.order_successful = true;
			obj_player_information_displays.current_money += other.order_cost;
		}
		else {
			other.order_successful = false;
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




instance_destroy();





