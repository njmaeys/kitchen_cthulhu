function movement_npcs() {


	// Calc movement but prevent if game is paused
	if obj_game_manager.game_paused {
		vx = 0;
		vy = 0;
	}
	else {
		vx = ((move_right - move_left) * move_speed);
		vy = ((move_up - move_down) * move_speed);
	}

	// If moving
	if (vx != 0 || vy != 0) {
		is_moving = true;
		
		// Handle collision for movement
		var _spr_x_increase = 10
		if vx < 0 {
			_spr_x_increase = _spr_x_increase * -1;
		}
	
		// Move player around but check for collisions with things in the world
		if !collision_point(x+vx+_spr_x_increase, y, obj_par_environment, true, true)
			and !collision_point(x+vx+_spr_x_increase, y, obj_npc_barrier, true, true)
		{
			x += vx;
		}
		else {
			reset_move_dir = true;
		}
		
		if !collision_point(x, y+vy, obj_par_environment, true, true) 
			and !collision_point(x, y+vy, obj_npc_barrier, true, true)
		{
			y += vy;
		}
		else {
			reset_move_dir = true;
		}
	}
	else {
		reset_move_dir = true
		is_moving = false;
	}
	
	// Sprite management
	movement_sprite_direction();
}


function npc_reset_move_dir() {
	randomize();
	
	reset_move_dir = false;

	move_left = irandom_range(-1, 0);
	move_right = irandom_range(-1, 0);
	move_up = irandom_range(0, 1);
	move_down = irandom_range(0, 1);
	
}


