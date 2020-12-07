x = 400;
y = 220;
image_xscale = .22;
image_yscale = .22;
if global.sound_on && audio_is_paused(sound_menu){
	audio_stop_all();
	audio_play_sound(sound_menu, 1, true);
}