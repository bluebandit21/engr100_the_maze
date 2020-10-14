draw_set_colour(c_black);
draw_set_font(fnt_game);
draw_text(x, y, "Level 1"); // need to make this dynamic
//Note(Andrew) -- I set curr_level to the right level in LoadLevel.
//You just need level select to do level = obj_level_1; loadLevel(level), effectively.
