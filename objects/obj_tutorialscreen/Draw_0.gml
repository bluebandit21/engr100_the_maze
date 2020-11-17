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