function stove_top_set_current_level_attributres() {
	/*
	Use this and similar functions like this to manage attributes based on the level
	of the item.
	*/

	switch obj_stove_top.current_level {
		case 1:
			obj_stove_top.current_cook_slots = 2;
			
			// Initialize the stove top as an empty array and so we know the items to expect
			obj_stove_top.currently_holding = []
			for (var _i = 0; _i < obj_stove_top.current_cook_slots; _i += 1) {
				obj_stove_top.currently_holding[_i] = -1;
			}
			return;
	}
}