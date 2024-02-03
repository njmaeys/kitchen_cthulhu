/// @description 


draw_self();



// TODO: Move to a function
if player_nearby
	and mouse_hovering
	and obj_player.plate_inst != -1
	and not obj_player.plate_inst.has_items // No viable items only empty and dirty
	and not obj_player.plate_inst.is_clean // Plate is dirty
{
	var _wash_progress_percentage = interaction_progress(obj_player.plate_inst.wash_time_max, obj_player.plate_inst.wash_time);
	draw_progress_meeter(_wash_progress_percentage, x, y-6, 0, spr_progress_meter);

	if obj_game_manager.game_paused {
		// If the game is paused the timer should halt
		return;
	}
	
	if mouse_check_button(mb_right) {
		obj_player.plate_inst.currently_washing = true;
		obj_player.plate_inst.image_alpha = 0;
		
		// Draw the washing stuff
		if sprite_index != spr_sink_washing {
			sprite_index = spr_sink_washing;
		}
		
		if obj_player.plate_inst.wash_time > 0 {
			obj_player.plate_inst.wash_time -= 1;
		}
		else {
			obj_player.plate_inst.is_clean = true;
			obj_player.plate_inst.wash_time = obj_player.plate_inst.wash_time_max;
			obj_player.plate_inst.currently_washing = false;
			obj_player.plate_inst.image_alpha = 1;
			sprite_index = spr_sink;
		}

	}
	else {
		obj_player.plate_inst.currently_washing = false;
		obj_player.plate_inst.image_alpha = 1;
		sprite_index = spr_sink;
	}
}

