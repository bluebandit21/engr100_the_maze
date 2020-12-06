if position_meeting(mouse_x, mouse_y, obj_optiontohome) {
	if (global.paused) {
		instance_destroy(obj_pausescreen, true);
	} else {
		specific_room_goto(room_get_name(room));
		maze_sprite(1);
	}
}
