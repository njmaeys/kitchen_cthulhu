/// @description 


if move_on_cooldown > 0 {
	move_on_cooldown -= 1;
}
else {
	if not instance_exists(obj_fade) {
		instance_create_depth(
			0,
			0,
			obj_game_manager.depth_menus,
			obj_fade,
			{target_room: where_to}
		);
	}
}





