draw_self(); 
draw_set_colour(c_white);

if pressed {
	draw_rectangle(75, 75, window_get_width() - 300, window_get_height() - 200, false);
	draw_set_color(c_black);
	draw_set_font(fnt_monospaced);
	draw_text(75, 75, "Your control for leftward movement is: " + print_keys(global.array_of_controls[2]));
 }