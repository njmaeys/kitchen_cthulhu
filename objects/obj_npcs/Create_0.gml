/// @description 

can_leave = false;
leave_path = -1;
is_leaving = false;
reset_move_dir = true;
move_speed = 0.5;
is_moving = false;
move_left = -1;
move_right = -1;
move_up = -1;
move_down = -1;

// Select what the sprite will be for the NPC
var _npc_spr_options = [
	{
		spr_moving: spr_npc_blue,
		spr_idle: spr_npc_idle_blue,
	},
	{
		spr_moving: spr_npc_red,
		spr_idle: spr_npc_idle_red,
	},
]

randomize();
spr_index = irandom((array_length(_npc_spr_options) - 1));
sprs = _npc_spr_options[spr_index];

sprite_index_moving = sprs.spr_moving;
sprite_index_idle = sprs.spr_idle;


// When spawned into the layer it needs to start on the path and set itself into
// the array on the dining area tracker
can_roam = false; // Don't try to reset the direction until it hits the end of the path
order_successful = -1;
start_order_end_pth_x = obj_dining_room_manager.leave_x;
start_order_end_pth_y = obj_dining_room_manager.leave_y;

array_push(obj_dining_room_manager.dining_currently, self.id);
path_to_follow = pth_enter;
path_start(
	path_to_follow,
	move_speed,
	path_action_stop,
	false
);

// Set what should be displayed in the queue tracker
queue_display = [];

// Track the order
has_items = false;
order_items = orderable_items();
currently_plated = npc_order_burger();




