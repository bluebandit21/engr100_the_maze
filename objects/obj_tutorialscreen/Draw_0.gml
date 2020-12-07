/// @description Insert description here
// You can write your code in this editor
if (global.curr_level_idx == 1) {
	draw_set_color(c_white);
    draw_rectangle(75, 75, window_get_width() - 300, window_get_height() - 100, false);

    draw_set_color(c_black);
    draw_set_font(fnt_game);
    draw_text(85, 100, "Welcome to The Maze!");
    draw_text(85, 175, "You are the pink smiley face, and you must");
    draw_text(85, 250, "reach the treasure chest in the lower right");
    draw_text(85, 325, "Your controls for movement are: ");
	draw_set_font(fnt_monospaced);
	draw_set_halign(fa_center);
    draw_text(850, 325, print_keys(global.array_of_controls[0]));
    draw_text(850, 375, print_keys(global.array_of_controls[2]) + " " + print_keys(global.array_of_controls[1]) + " " + print_keys(global.array_of_controls[3]));
	draw_set_font(fnt_game);
	draw_set_halign(fa_left);
	draw_text(85, 425, "Maze solver button: " + print_keys(global.array_of_controls[4]));
    draw_text(85, 500, "Press Escape to pause");
	draw_text(85, 575, "Press Enter to dismiss");
}

if (global.curr_level_idx == 2) {
    draw_set_color(c_white);
    draw_rectangle(75, 150, window_get_width() - 75, 3 * window_get_height() / 4, false);

    draw_set_color(c_black);
    draw_set_font(fnt_game);
    draw_text(85, 200, "Introducing a new mechanic: Gates/Levers!");
    draw_text(85, 275, "Hit a lever");

    if (global.color_is_enabled) {
		draw_rectangle(300, 265, 360, 325, false);
		draw_sprite_ext(spr_lever_color_green, 0, 305, 265, 0.2, 0.2, 0, c_white, 1);
	} else
		draw_sprite(spr_lever_green, 0, 295, 265);

    draw_text(375, 275, "and the gate");

    if (global.color_is_enabled) {
		draw_rectangle(625, 260, 675, 310, false);
		draw_sprite_ext(spr_gate_color_green, 0, 630, 258, 0.25, 0.25, 0, c_white, 1);
	} else
		draw_sprite(spr_gate_green, 0, 625, 260);

    if (global.color_is_enabled)
		draw_text(695, 275, "with the same shape will open");
	else
		draw_text(695, 275, "with the same color will open");

    draw_text(85, 350, "If you hit the lever again, the gate will close");
    draw_text(85, 425, "Press Enter to dismiss");
}

if (global.curr_level_idx == 6) {
    draw_set_color(c_white);
    draw_rectangle(75, 150, window_get_width() - 75, 3 * window_get_height() / 4, false);

    draw_set_color(c_black);
    draw_set_font(fnt_game);
    draw_text(85, 200, "Introducing a new mechanic: Teleporters!");
    draw_text(85, 275, "Hit a teleporter");
    draw_sprite(spr_tele_blue, 0, 370, 265);
    draw_text(430, 275, "and you will warp to the other teleporter");
    draw_text(85, 350, "in the maze!");
    draw_text(85, 450, "Press Enter to dismiss");
}

if (global.curr_level_idx == 9) {
    draw_set_color(c_white);
    draw_rectangle(75, 150, window_get_width() - 75, 3 * window_get_height() / 4, false);

    draw_set_color(c_black);
    draw_set_font(fnt_game);
    draw_text(85, 200, "Introducing a new mechanic: Ice!");
    draw_text(85, 275, "Hit an ice tile");
    draw_sprite(spr_ice, 0, 350, 265);
    draw_text(430, 275, "and you will slide across the ice,");
    draw_text(85, 350, "unable to move until the icy tiles end!");
    draw_text(85, 450, "Press Enter to dismiss");
}

if (global.curr_level_idx == 11) {
	draw_set_color(c_white);
    draw_rectangle(75, 150, window_get_width() - 75, 3 * window_get_height() / 4, false);

    draw_set_color(c_black);
    draw_set_font(fnt_game);
    draw_text(85, 200, "Introducing a new mechanic: Icy gates!");
    draw_text(85, 275, "Hit an ice tile");
    draw_sprite(spr_ice, 0, 350, 265);
    draw_text(430, 275, "and you will slide across the ice,");
    draw_text(85, 350, "stopping when you hit the closed gate");
	draw_sprite(spr_icygate_blue, 0, 825, 340);
	draw_text(85, 425, "If the gate is open, you'll slide through without stopping!");
    draw_text(85, 525, "Press Enter to dismiss");
}
