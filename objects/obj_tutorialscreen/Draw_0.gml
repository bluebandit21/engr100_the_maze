/// @description Insert description here
// You can write your code in this editor
if (global.curr_level_idx == 1) {
    draw_set_colour(c_white);
    draw_rectangle(150, 150, 3 * window_get_width() / 4, 3 * window_get_height() / 4, false);

    draw_set_colour(c_black);
    draw_set_font(fnt_game);
    draw_text(160, 200, "Welcome to The Maze!");
    draw_text(160, 275, "You are the pink smiley face, and you must");
    draw_text(160, 350, "reach the finish flag in the lower right");
    draw_text(160, 425, "Your controls are: ");
    draw_text(695, 415, global.array_of_controls[1]);
    draw_text(660, 455, global.array_of_controls[3]);
    draw_text(700, 455, global.array_of_controls[2]);
    draw_text(740, 455, global.array_of_controls[4]);
    draw_text(160, 500, "Press Enter to dismiss");
}

if (global.curr_level_idx == 2) {
    draw_set_colour(c_white);
    draw_rectangle(75, 150, window_get_width() - 75, 3 * window_get_height() / 4, false);

    draw_set_colour(c_black);
    draw_set_font(fnt_game);
    draw_text(85, 200, "Introducing a new mechanic: Gates/Levers!");
    draw_text(85, 275, "Hit a lever");
	draw_sprite(spr_lever_red, 0, 295, 265);
	draw_text(375, 275, "and the gate");
	draw_sprite(spr_gate_red, 0, 625, 260);
	draw_text(695, 275, "with the same color will open");
    draw_text(85, 350, "If you hit the lever again, the gate will close");
    draw_text(85, 425, "Press Enter to dismiss");
}