function depth_sort(){
	// Depth sort
	depth =- y;
}

function close_to_player() {
	// Based on an item's look_distance see if the player is nearby
	if distance_to_object(obj_player) <= look_distance {
		return true;
	}
	
	// Default to false if player isn't nearby
	return false
}