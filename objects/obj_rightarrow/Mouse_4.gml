if position_meeting(mouse_x, mouse_y, obj_rightarrow) {
	if asset_get_index("obj_level_" + string(global.curr_level_idx + 1)) > -1 {
		maze_sprite(global.curr_level_idx + 1);
		global.curr_level_idx++;
	}
}
