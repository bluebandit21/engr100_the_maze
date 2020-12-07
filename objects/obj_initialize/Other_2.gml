global.lock = 2;
global.prev_lock = 2;
global.played = 0;
global.adjust_speed = 12;

global.color_is_enabled = false;
global.sound_on = true;
global.draw_down = false;
global.draw_up = false;
global.draw_left = false;
global.draw_right = false;
global.draw_maze = false;

global.array_of_controls[0] = vk_up;
global.array_of_controls[1] = vk_down;
global.array_of_controls[2] = vk_left;
global.array_of_controls[3] = vk_right;
global.array_of_controls[4] = vk_space;

audio_play_sound(sound_menu,1,true);

maze_sprite(1);