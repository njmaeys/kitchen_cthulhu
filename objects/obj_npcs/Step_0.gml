/// @description 


if not can_roam 
	and path_position == 1
{
	can_roam = true;
	wait_time_start_countdown = true;
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



// Collision box for burger hits
// [_x_left, _x_right, _y_bottom, _y_top]
burger_collision_box = npc_burger_collison_box();

// If it hits an NPC then destroy it and do checks if the burger was correct or not
if instance_exists(obj_burger_toss)
	and npc_burger_hit_customer(obj_burger_toss.x_left, obj_burger_toss.y_top, obj_burger_toss.x_right, obj_burger_toss.y_bottom)
{
	burger_order_collision_verification();
	
	instance_destroy(obj_burger_toss);
}



// TODO: Move to function
if wait_time_start_countdown
	and wait_time_current < wait_time_max 
{
	wait_progress_percentage = 100 - interaction_progress(wait_time_max, wait_time_current);
	
	wait_time_current += 1;
	
	if wait_time_current == wait_time_max {
		wait_timer_ran_out();
	}
}





depth_sort();




