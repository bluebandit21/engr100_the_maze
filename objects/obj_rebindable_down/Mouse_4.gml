if position_meeting(mouse_x,mouse_y,obj_rebindable_down){
	downKey = get_string_async("Enter desired downward movement key", global.array_of_controls[2]);
	global.key = 2;
}