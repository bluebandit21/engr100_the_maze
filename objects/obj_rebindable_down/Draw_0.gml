draw_self(); 
draw_set_colour(c_white);

if pressed {
	draw_set_color(c_black);
	draw_set_font(fnt_monospaced);
	draw_set_halign(fa_center);
	draw_text(window_get_width()/2, 37, "Your control for downward movement is: " + print_keys(global.array_of_controls[1]));
	draw_text(window_get_width()/2, 75, "Press Enter to save key");
	draw_set_halign(fa_left); 
}