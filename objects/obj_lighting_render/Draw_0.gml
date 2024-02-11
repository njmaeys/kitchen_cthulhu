/// @description 

depth = obj_game_manager.depth_menus;


if not surface_exists(lighting_surface) {
	lighting_surface = surface_create(
		room_width,
		room_height
	);
}


surface_set_target(
	lighting_surface
);

// TODO: Set these as variables
draw_clear_alpha(
	c_black,
	obj_game_manager.room_darkness_level
);


// Check for the cutouts and do somethign with it
//with obj_lighting_cutout {
gpu_set_blendmode(
	bm_subtract
);

for (var _i = 0; _i < instance_number(obj_lighting_cutout); ++_i;) {
	var _item = instance_find(obj_lighting_cutout, _i);
	
	if _item.is_visible {
		// This creates the hole in the surface
		draw_sprite_ext(
			_item.sprite_index,
			_item.image_index,
			_item.x,
			_item.y,
			_item.image_xscale,
			_item.image_yscale,
			0,
			c_white,
			1
		);
		
	}

}
	
gpu_set_blendmode(
	bm_normal
);

surface_reset_target();


draw_surface(
	lighting_surface,
	0,
	0
);
