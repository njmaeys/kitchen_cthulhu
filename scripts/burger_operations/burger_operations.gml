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
	// TODO: Make it throw in the direction of the mouse
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