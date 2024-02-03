/// @description 


if not can_roam 
	and path_position == 1
{
	can_roam = true;
}



if reset_move_dir 
	and can_roam
{
	npc_reset_move_dir();
}

movement_npcs();



if order_successful != -1 {
	can_leave = true;
}

if can_leave {
	if leave_path == -1 {
		// Generate a leave path for the NPCs
		leave_path = path_add();

		mp_potential_path(
			leave_path,
			obj_dining_room_manager.leave_x,
			obj_dining_room_manager.leave_y,
			move_speed,
			4,
			0
		);
		path_start(
			leave_path,
			move_speed,
			path_action_stop,
			true
		);
	}

	// TODO: Eventually fix the way they kinda just moon walk out.
	// They don't fix the way they are facing but the pathing is working
	// so that's good enough for now
	if leave_path != -1
		and path_position == 1 {
		instance_destroy();
	}
}



depth_sort();




