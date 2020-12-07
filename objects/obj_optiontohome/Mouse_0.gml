if position_meeting(mouse_x, mouse_y, obj_optiontohome) {
	if (variable_global_exists("paused")) {
		if (global.paused && room == rm_level) {
			instance_destroy(obj_pausescreen, true);
		} else {
			specific_room_goto(room_get_name(room));
			maze_sprite(1);
		}
	} else {
		specific_room_goto(room_get_name(room));
		maze_sprite(1);
	}
}
