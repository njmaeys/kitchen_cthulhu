function stove_top_set_current_level_attributres() {
	/*
	Use this and similar functions like this to manage attributes based on the level
	of the item.
	*/

	switch obj_stove_top.current_level {
		case 1:
			obj_stove_top.current_cook_slots = 2;
			return;
	}
}