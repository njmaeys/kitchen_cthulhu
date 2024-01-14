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