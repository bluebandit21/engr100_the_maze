global.lock = 2;
global.prev_lock = 2;
global.played = 0;
global.adjust_speed = 12;

global.sound_on = true;
global.chesney = false;
global.color = false;
global.paused = false
global.choosing_speed = false;

global.array_of_controls[0] = vk_up;
global.array_of_controls[1] = vk_down;
global.array_of_controls[2] = vk_left;
global.array_of_controls[3] = vk_right;
global.array_of_controls[4] = vk_space;
global.array_of_controls[5] = vk_tab;

audio_play_sound(sound_menu,1,true);

maze_sprite(1);

global.isHintToggled = false;
global.isMazeToggled = false;