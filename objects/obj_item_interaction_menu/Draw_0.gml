/// @description 

draw_self();


// Craw whatever is being asked to be drawn
switch obj_creation_type {
	case "fridge":
		image_xscale = 3;
		fridge_draw_selections();
		break;
	case "bun_and_lettuce_container":
		image_xscale = 2;
		bun_and_lettuce_draw_selections();
		break;
}


