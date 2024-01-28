/// @description 


draw_self();



if can_roam {
	// TODO: Put an "order" timer and "patience" timer in here
	// TODO: Put in happy and angry "emjoi" when they get it correct or wrong
	npc_draw_burger_order_state();

	if order_successful == -1 {
		// -1 means there has been no burger tossed in NPCs face
		npc_draw_burger_order();
	}
}




