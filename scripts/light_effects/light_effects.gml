
function draw_light_color_under_obj(_light_inst) {
	draw_sprite_ext(
		spr_light,
		1,
		_light_inst.x,
		_light_inst.y,
		_light_inst.image_xscale,
		_light_inst.image_yscale,
		0,
		_light_inst.color,
		_light_inst.intensity
	);
}