draw_self(); 
draw_set_colour(c_white);

if pressed {
	draw_rectangle(75, 75, window_get_width() - 300, window_get_height() - 200, false);
	draw_set_color(c_black);
	draw_set_font(fnt_monospaced);
	draw_text(75, 75, "Pick a speed: Slow, Medium, Fast");
	instance_create_depth(75,175,-16000,obj_low_speed);
	instance_create_depth(375,175,-16000,obj_mid_speed);
	instance_create_depth(675,175,-16000,obj_high_speed);
}