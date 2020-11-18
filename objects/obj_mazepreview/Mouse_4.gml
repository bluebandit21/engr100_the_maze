if (global.lock > global.curr_level_idx) {
	if position_meeting(mouse_x, mouse_y, obj_mazepreview) {
		room_goto(rm_level);
		instance_destroy(obj_mazepreview);
		if global.sound_on
			audio_play_sound(sound_bgm,1,true);
	}
}
maze_sprite(1);
