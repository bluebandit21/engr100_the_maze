if position_meeting(mouse_x,mouse_y,obj_rebindable_down){
	global.downKey = get_string_async("Enter desired downward movement key", "S");
	global.key = 2;
}