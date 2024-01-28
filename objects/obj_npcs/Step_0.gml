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

	/*
	TODO: When I come back I need to pick up from here to get the NPC to start to leave.
	I need the NPC to begin to move towards the path exit and then when it hit's the path
	exit just follow the path. I'm not sure how to really handle this all that well just yet
	so this is going to take some toying around with 
	*/
}



depth_sort();




