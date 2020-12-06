if room_get_name(room) = "rm_level" {
	var sound = sound_bgm;
	var is_menu = false
}
else {
	sound = sound_menu;
	is_menu = true;
}
toggleSound(sound, is_menu);