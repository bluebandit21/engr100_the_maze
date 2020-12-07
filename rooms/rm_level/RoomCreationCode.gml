Initialize();
var level = instance_create_depth(0,0,0,asset_get_index("obj_level_" + string(global.curr_level_idx)));
LoadLevel(level);
global.isLevelLoaded = true;
if global.sound_on{
	audio_pause_all();
	audio_play_sound(sound_bgm,1,true);
}