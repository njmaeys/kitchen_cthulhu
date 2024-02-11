/// @description

// Can use check
if not can_use {
	return;
}

// Mouse checks
mouse_hovering = mouse_hovering_location(_x1, _y1, _x2, _y2);


// Player checks
player_nearby = close_to_player();
if currently_holding == -1 
	or obj_player.plate_inst != -1
{
	counter_place_item();
}
else {
	if not currently_chopping {
		counter_take_item();
	}
	
	counter_chop_item();

	
	if plate_inst != -1 {
		plate_inst.x = self.x + 6;
		plate_inst.y = self.y - 32;
		
		counter_place_item();
	}
}



// Chopping Sound
if control_chop_sound
	and currently_chopping
{
	if not audio_is_playing(snd_chop) {
		audio_play_sound(
			snd_chop,
			1,
			true,
			1,
			0,
			1.5
		);
	}

}




// Depth sort
depth_sort();


