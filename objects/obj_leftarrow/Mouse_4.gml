if position_meeting(mouse_x, mouse_y, obj_leftarrow) {
	if asset_get_index("obj_level_" + string(global.curr_level_idx - 1)) > -1 {
		instance_destroy(obj_mazepreview);
		maze_sprite(global.curr_level_idx - 1);
		instance_create_layer(0,0,"Instances", obj_mazepreview);
		global.curr_level_idx--;
	}
}
