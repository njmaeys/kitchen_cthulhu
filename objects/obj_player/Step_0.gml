/// @description


// Player movement
movement_player();

// Sound moving
if is_moving {
	if not audio_is_playing(snd_walk) {
		audio_play_sound(
			snd_walk,
			1,
			true,
			1,
			0,
			1.2
		);
	}
}
else {
	if audio_is_playing(snd_walk) {
		audio_stop_sound(snd_walk);
	}
}



// Track and move the player light source
player_light_source.x = x;
player_light_source.y = y;




// Depth sort
depth_sort();



