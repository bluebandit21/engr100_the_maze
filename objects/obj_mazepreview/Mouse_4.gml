if (global.lock > global.curr_level_idx) {
	if position_meeting(mouse_x, mouse_y, obj_mazepreview) {
		room_goto(rm_level);
		instance_destroy(obj_mazepreview);
	}
}
maze_sprite(1);
