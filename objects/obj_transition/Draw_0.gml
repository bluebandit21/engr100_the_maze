/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_black);
draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_text(window_get_width() / 2, window_get_height() / 2 - 200, "Congratulations! You have completed level " + string(global.curr_level_idx));
draw_set_halign(fa_left);
