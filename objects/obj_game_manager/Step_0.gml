/// @description 


if keyboard_check_pressed(vk_escape) {
	camera_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
	camera_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
	
	game_paused = !game_paused;
}






