draw_self(); 
draw_set_colour(c_white);

if global.draw_left {
	draw_rectangle(75, 75, window_get_width() - 300, window_get_height() - 200, false);
	draw_set_color(c_black);
	draw_set_font(fnt_game);
	draw_text(75, 75, "Your controls for movement are: " + print_keys(global.array_of_controls[3]));
 }