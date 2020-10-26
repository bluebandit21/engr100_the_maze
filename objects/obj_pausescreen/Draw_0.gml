/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);

draw_set_colour(c_black);
draw_set_font(fnt_game);
draw_text(window_get_width() / 2 - 75, window_get_height() / 2, "Paused");


