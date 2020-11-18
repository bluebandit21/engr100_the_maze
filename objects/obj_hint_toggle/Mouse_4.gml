if position_meeting(mouse_x,mouse_y,obj_hint_toggle) && !global.hint_toggled{
	object_set_sprite(obj_hint_toggle,spr_hint_toggled_on);
	instance_destroy();
	instance_create_depth(40,300,-16000,obj_hint_toggle);
	global.hint_toggled = true;
}
else if position_meeting(mouse_x,mouse_y,obj_hint_toggle) && global.hint_toggled{
	
	object_set_sprite(obj_hint_toggle,spr_hint_toggled_off);
	instance_destroy();
	instance_create_depth(40,300,-16000,obj_hint_toggle);
	global.hint_toggled = false;
	
}