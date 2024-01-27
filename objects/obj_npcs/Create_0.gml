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


/*

TODO: When picking up next start getting the npcs to select a burger at random.
This needs to be displayed above their head as they walk around and it needs to be
on a timer that if they don't get after x amount of time they will leave.

Need to have the burger collision with NPC be checked and on success do a thing.
Either way if the NPC get's a burger they will leave. If it's good then money go up
if it's bad then... I'm not sure yet but some sort of consequence

*/



