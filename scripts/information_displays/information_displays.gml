function draw_cook_queue(){
	if array_length(obj_dining_room_manager.dining_currently) > 0 {
	
		for (var _i = 0; _i < array_length(obj_dining_room_manager.dining_currently); _i += 1) {
			var _npc = obj_dining_room_manager.dining_currently[_i]
		
				
			var _queue_item_x = cook_order_queue_x;	
		
			// Draw the container
			draw_sprite_stretched(
				spr_menu_item_interaction,
				0,
				_queue_item_x,
				cook_order_queue_y,
				68,
				20
			);		

			for (var _s = 0; _s < array_length(_npc.queue_display); _s += 1) {
				var _spr = _npc.queue_display[_s];

				// Draw the actual ingredient
				draw_sprite_ext(
					_spr,
					0,
					_queue_item_x + 4,
					cook_order_queue_y + 4,
					0.75,
					0.75,
					0,
					c_white,
					1
				);
				_queue_item_x += 12;
			}
			cook_order_queue_y += 22;
		}
	}
}