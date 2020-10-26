if position_meeting(mouse_x, mouse_y, obj_rebindable_up) {
	upKey = get_string_async("Enter desired upward movement key", global.array_of_controls[1]);
	global.key = 1;
}
