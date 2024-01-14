function all_possible_ingredients() {
	// For anything that has a chopped item I'm going to try and set
	// a separate item for it and see how I like that methodology
	return {
		tomato: {
			spr: spr_tomato,
			name: "tomato",
			needs_chopped: true,
			chop_time: 120,
		},
		tomato_chopped: {
			spr: spr_tomato_chopped,
			name: "tomato_chopped",
			needs_chopped: false,
			chop_time: 0,
		},
	}
}