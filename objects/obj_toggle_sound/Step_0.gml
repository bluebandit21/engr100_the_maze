var current_room = room_get_name(room);
switch current_room {
	case "rm_level":
		var sound = sound_bgm;
	case "rm_complete":
		sound = sound_end;
	default:
		sound = sound_menu;
}

toggleSound(sound);