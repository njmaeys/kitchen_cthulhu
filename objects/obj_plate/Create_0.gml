/// @description 

// NOTE: I want this to be completely addative. 
// Meaning... once you add something that's it, it's on the plate
// Only trash can or customer can "clear" the plate and it always results in a dirty plate.
currently_plated = copy_struct(obj_ingredient_manager.plateable_items); 

// What is happening to the plate
is_being_carried = false;
is_on_counter = false;
is_clean = true;

// Use this to help set and usent a dirty plate sprite
has_items = false;


