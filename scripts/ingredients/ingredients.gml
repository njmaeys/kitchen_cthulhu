function all_possible_ingredients() {
	// For anything that has a chopped item I'm going to try and set
	// a separate item for it and see how I like that methodology
	return {
		// Plate is not a cookable item but gives the ability to 
		// check for the usage of a plate to block other stuff
		plate: {
			spr: spr_dummy_placeholder,
			name: "plate",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		tomato: {
			spr: spr_tomato,
			name: "tomato",
			needs_chopped: true,
			chop_time: 120,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		tomato_chopped: {
			spr: spr_tomato_chopped,
			name: "tomato_chopped",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		cheese: {
			spr: spr_cheese,
			name: "cheese",
			needs_chopped: true,
			chop_time: 120,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		cheese_chopped: {
			spr: spr_cheese_chopped,
			name: "cheese_chopped",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		lettuce: {
			spr: spr_lettuce,
			name: "lettuce",
			needs_chopped: true,
			chop_time: 120,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		lettuce_chopped: {
			spr: spr_lettuce_chopped,
			name: "lettuce_chopped",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		burger: {
			spr: spr_burger,
			name: "burger",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: true,
			cook_time: 600,
			burn_time: 0,
		},
		burger_cooked: {
			spr: spr_burger_cooked,
			name: "burger_cooked",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 480,
		},
		burger_burnt: {
			spr: spr_burger_burnt,
			name: "burger_burnt",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		burger_bun: {
			spr: spr_burger_bun,
			name: "burger_bun",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		burger_bun_bottom: {
			spr: spr_burger_bun_bottom,
			name: "burger_bun_bottom",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
		burger_bun_top: {
			spr: spr_burger_bun_top,
			name: "burger_bun_top",
			needs_chopped: false,
			chop_time: 0,
			needs_cooked: false,
			cook_time: 0,
			burn_time: 0,
		},
	}
}

function interaction_progress(_total, _current) {
	/*
	Utilize this for when an ingredient needs to be prepped/cooked/chopped/washed/...
	
	Pass in the expected total (_total) amount of time and current (_current) amount of time left
	*/
	
	var _percentage_whole = 100 * ((_total - _current) / _total);
	return floor(_percentage_whole);
}

function orderable_items() {
	var _all = all_possible_ingredients();
	
	return {
		burger_bun_top: _all.burger_bun_top,
		burger_bun_bottom: _all.burger_bun_bottom,
		burger_cooked: _all.burger_cooked,
		tomato_chopped: _all.tomato_chopped,
		lettuce_chopped: _all.lettuce_chopped,
		cheese_chopped: _all.cheese_chopped,
	}
}