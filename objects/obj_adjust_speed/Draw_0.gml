draw_self(); 
draw_set_colour(c_white);

if pressed {
	draw_rectangle(300, 20, 1100, 500, false);
	draw_set_color(c_black);
	draw_set_font(fnt_monospaced);
	draw_set_halign(fa_center);
	draw_text(window_get_width()/2, 37, "Pick a speed: Slow, Medium, Fast");
	draw_text(window_get_width()/2, 75, "Press Enter to save changes");
	instance_create_depth(window_get_width()/2 - 375,175,-16000,obj_low_speed);
	instance_create_depth(window_get_width()/2 - 125,175,-16000,obj_mid_speed);
	instance_create_depth(window_get_width()/2 + 125,175,-16000,obj_high_speed);
}