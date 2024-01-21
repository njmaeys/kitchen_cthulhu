/// @description 


draw_self();



// Draw all of the plated items
// I don't love this but I have to set the order manually how I want things plated
var _plated_items = [
	"burger_bun_bottom",
	"burger_cooked",
	"cheese_chopped",
	"lettuce_chopped",
	"tomato_chopped",
	"burger_bun_top",
];
var _plated_items_x_offset = x + 3;
var _plated_items_y_offset = y + 1;
for (var _i = 0; _i < array_length(_plated_items); _i += 1) {
	var _key = _plated_items[_i];
    var _value = currently_plated[$ _key];
	
	if _value == -1 {
		continue;
	}
	
	has_items = true;
	
	
	draw_sprite_ext(
		_value.spr,
		0,
		_plated_items_x_offset,
		_plated_items_y_offset,
		0.75,
		0.75,
		0,
		c_white,
		1
	);
	
	_plated_items_y_offset -= 2;
}
