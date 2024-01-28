/// @description 

can_leave = false;
reset_move_dir = true;
move_speed = 1;
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

array_push(obj_dining_room_manager.dining_currently, self.id);
path_to_follow = pth_enter_exit;
path_start(
	path_to_follow,
	move_speed,
	path_action_stop,
	false
);


// Track the order
has_items = false;
order_items = orderable_items();
npc_order_burger();

