function draw_constructed_burger() {
	var _plated_items = [
		"burger_bun_bottom",
		"burger_cooked",
		"cheese_chopped",
		"lettuce_chopped",
		"tomato_chopped",
		"burger_bun_top",
	];
	var _plated_items_x_offset = x + 3;
	var _plated_items_y_offset = y + 1;
	for (var _i = 0; _i < array_length(_plated_items); _i += 1) {
		var _key = _plated_items[_i];
	    var _value = currently_plated[$ _key];
	
		if _value == -1 {
			continue;
		}
	
		has_items = true;
	
		draw_sprite_ext(
			_value.spr,
			0,
			_plated_items_x_offset,
			_plated_items_y_offset,
			0.75,
			0.75,
			0,
			c_white,
			1
		);
	
		_plated_items_y_offset -= 2;
	}
}

function throw_burger() {
	// Spawn the burger
	instance_create_layer(
		obj_player.plate_inst.x,
		obj_player.plate_inst.y,
		"Main",
		obj_burger_toss
	);
	
	obj_player.plate_inst.currently_plated = copy_struct(obj_ingredient_manager.plateable_items);
	obj_player.plate_inst.has_items = false;
	obj_player.plate_inst.is_clean = false;
}


function npc_order_burger() {
	// Randomly set what type of burger the customer wants
	var _random_choices = [
		{
			name: "cheese_chopped",
			insert: order_items.cheese_chopped,
		},
		{
			name: "lettuce_chopped",
			insert: order_items.lettuce_chopped,
		},
		{
			name: "tomato_chopped",
			insert: order_items.tomato_chopped,
		},
	]

	var _temp_currently_plated = {
		burger_bun_top: order_items.burger_bun_top, // Always need this
		burger_bun_bottom: order_items.burger_bun_bottom, // Always need this
		burger_cooked: order_items.burger_cooked, // Always need this
		cheese_chopped: -1,
		lettuce_chopped: -1,
		tomato_chopped: -1,
	}
	
	// Send all the starting images into the display array
	array_push(queue_display, obj_ingredient_manager.all_ingredients.burger_bun.spr);
	array_push(queue_display, obj_ingredient_manager.all_ingredients.burger_cooked.spr);

	
	// NOTE: Uncomment or Comment this for statement to make burger orders easy during testing
	for (var _i = 0; _i < array_length(_random_choices); _i += 1) {
		var _item = _random_choices[_i]
		
		randomize();
		
		var _set_choice = irandom_range(0, 1);
		
		// Use 0 to kick to the next item in the list only set the value if it's 1
		if _set_choice == 0 {
			continue;
		}
		
		switch _item.name {
			case "cheese_chopped": 
				_temp_currently_plated.cheese_chopped = _item.insert;
				array_push(queue_display, _item.insert.spr);
				order_cost += 1;
				continue;
				
			case "lettuce_chopped": 
				_temp_currently_plated.lettuce_chopped = _item.insert;
				array_push(queue_display, _item.insert.spr);
				order_cost += 1;
				continue;
				
			case "tomato_chopped": 
				_temp_currently_plated.tomato_chopped = _item.insert;
				array_push(queue_display, _item.insert.spr);
				order_cost += 1;
				continue;
		}
	}
	
	return _temp_currently_plated;
}


function npc_draw_burger_order_state() {
	// This is used to draw the container for the burger and NPC happy/sad

	var _spr_index = 0;
	
	if order_successful == true {
		_spr_index = 2;
	}
	
	if order_successful == false {
		_spr_index = 1;
	}
	
	var _plated_items_x_offset = x - 11;
	var _plated_items_y_offset = y - 56;
	draw_sprite(
		spr_npc_intention_indicator,
		_spr_index,
		_plated_items_x_offset,
		_plated_items_y_offset
	);
}



function npc_draw_burger_order() {
	var _plated_items = [
		"burger_bun_bottom",
		"burger_cooked",
		"cheese_chopped",
		"lettuce_chopped",
		"tomato_chopped",
		"burger_bun_top",
	];
	var _plated_items_x_offset = x - 5;
	var _plated_items_y_offset = y - 42;
	for (var _i = 0; _i < array_length(_plated_items); _i += 1) {
		var _key = _plated_items[_i];
	    var _value = currently_plated[$ _key];
	
		if _value == -1 {
			continue;
		}
	
		has_items = true;
	
		draw_sprite_ext(
			_value.spr,
			0,
			_plated_items_x_offset,
			_plated_items_y_offset,
			0.75,
			0.75,
			0,
			c_white,
			1
		);
	
		_plated_items_y_offset -= 2;
	}
}


function order_matches_delivered(_ordered, _delivered) {
	var _keys = variable_struct_get_names(_ordered);
	
    for (var _i = array_length(_keys) - 1; _i >= 0; --_i) {
			// Key should be shared between the two
            var _key = _keys[_i];
			//show_debug_message($"Key: {_key}");
			
			// Check the two structs
            var _value_ordered = _ordered[$ _key];
            var _value_delivered = _delivered[$ _key];

			// These two if statements are kinda jank but whatever it works...
			if _value_ordered == -1
				and _value_delivered != -1
			{
				// As soon as one thing is wrong just kick out. ALL must match
				return false;
			}
			
			if _value_ordered != -1
				and _value_delivered == -1 {
				// As soon as one thing is wrong just kick out. ALL must match
				return false;
			}
			
    }
	
	return true;
}