draw_set_colour(c_black);
draw_set_font(fnt_game);
global.curr_level = asset_get_index("obj_level_" + string(global.curr_level_idx));
draw_text(x, y, "Level " + string(global.curr_level_idx)); // need to make this dynamic
//Note(Andrew) -- I set curr_level to the right level in LoadLevel.
//You just need level select to do level = obj_level_1; loadLevel(level), effectively.
