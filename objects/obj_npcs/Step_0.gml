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





depth_sort();




