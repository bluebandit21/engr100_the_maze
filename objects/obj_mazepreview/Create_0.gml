x = 450;
y = 150;
image_xscale = .32;
image_yscale = .32;
if global.sound_on && audio_is_paused(sound_menu){
	audio_stop_all();
	audio_play_sound(sound_menu, 1, true);
}