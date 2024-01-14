function mouse_hovering_object()
{
	var _mx = mouse_x;
	var _my = mouse_y;
	
	if point_in_rectangle(
		_mx,
		_my,
		self.bbox_left,
		self.bbox_top,
		self.bbox_right,
		self.bbox_bottom
	) {
		return true;
	}
	else {
		return false;
	}
}

function mouse_hovering_location(_x1, _y1, _x2, _y2) {
	// This is a bit more nuanced since not all collision masks (bounding boxes)
	// work for where I expect the player to click
	var _mx = mouse_x;
	var _my = mouse_y;
	
	if point_in_rectangle(
		_mx,
		_my,
		_x1,
		_y1,
		_x2,
		_y2
	) {
		return true;
	}
	else {
		return false;
	}
}