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
	Bugs found by Kaitlin
	
	Place plate under item on counter
	
	Dirty plate is making order incorrect with F key 
	
	Fridge menu open can select item from counter next to it
	
	Leave plate in sink?
	
	Stack items not on plate and just on bare counter
	
	Clean plate hit F made dirty
	*/
	
}



depth_sort();




