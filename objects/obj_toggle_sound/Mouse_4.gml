if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && global.sound_on{
	audio_pause_sound(sound_bgm);
	object_set_sprite(obj_toggle_sound,spr_sound_toggle_off);
	instance_destroy();
	instance_create_depth(40, 200, -16000, obj_toggle_sound);
	global.sound_on = false;
}
else if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && !global.sound_on{
	audio_play_sound(sound_bgm,1,true);
	object_set_sprite(obj_toggle_sound,spr_sound_toggle_on);
	instance_destroy();
	instance_create_depth(40, 200, -16000, obj_toggle_sound);
	global.sound_on = true;
}