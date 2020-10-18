if position_meeting(mouse_x, mouse_y, obj_optiontohome) {
	room_goto(rm_titlescreen);
	instance_destroy(obj_rebindable_up);
	instance_destroy(obj_rebindable_down);
	instance_destroy(obj_rebindable_left);
	instance_destroy(obj_rebindable_right);
}