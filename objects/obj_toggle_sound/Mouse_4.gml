if room_get_name(room) = "rm_level" 
		var sound = sound_bgm;
	else if room_get_name(room) = "rm_complete" 
		sound = sound_end;
	else
		sound = sound_menu; 
		
if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && global.sound_on{
	toggleSound(sound);
}

else if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && !global.sound_on{
	toggleSound(sound);
}