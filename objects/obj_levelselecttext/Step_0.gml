if (global.lock <= global.curr_level_idx)
	obj_lock.visible = true;
else if instance_exists(obj_lock) && (global.lock > global.curr_level_idx)
	obj_lock.visible = false;