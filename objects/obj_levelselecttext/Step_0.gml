if (global.lock <= global.curr_level_idx)
	instance_create_layer(425,200,"lock",obj_lock);
else if instance_exists(obj_lock) && (global.lock > global.curr_level_idx)
	instance_destroy(obj_lock);