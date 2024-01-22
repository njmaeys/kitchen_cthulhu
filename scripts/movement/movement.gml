function movement_player() {
	// Check keys for movement
	move_left = keyboard_check(ord("A"));
	move_right = keyboard_check(ord("D"));
	move_up = keyboard_check(ord("W")) * -1; // -1 otherwise inverted
	move_down = keyboard_check(ord("S")) * -1; // -1 otherwise inverted

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
		{
			x += vx;
		}
		if !collision_point(x, y+vy, obj_par_environment, true, true) 
		{
			y += vy;
		}
	}
	else {
		is_moving = false;
	}
	
	// Sprite management
	movement_sprite_direction();
}

function movement_sprite_direction() {
	// Based on the obj is_moving bool and the next place it's x is going to go
	// the sprite should flip if the next x is lower
	
	if is_moving {
		sprite_index = sprite_index_moving;
		if x + vx < x {
			image_xscale = -1;
		}
		else {
			image_xscale = 1;
		}
	}
	else {
		sprite_index = sprite_index_idle;
	}
	

	
}