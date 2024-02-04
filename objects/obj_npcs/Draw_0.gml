/// @description 


draw_self();



if can_roam 
	and obj_dining_room_manager.dining_is_open
{
	// TODO: Put an "order" timer and "patience" timer in here
	npc_draw_burger_order_state();

	if order_successful == -1 {
		// -1 means there has been no burger tossed in NPCs face
		npc_draw_burger_order();
	}
}




