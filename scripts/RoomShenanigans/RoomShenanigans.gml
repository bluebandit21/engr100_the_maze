// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function next_room() {
	global.isLevelLoaded = false;
	var name = asset_get_index("obj_level_" + string(global.curr_level_idx + 1));
	if name > -1 {
		global.curr_level_idx++;
		global.maze_toggled = false;
		global.hint_toggled = false;
		global.maze_on = true;
		room_persistent = false;
		room_goto(rm_level);
	}
	else
		room_goto(rm_complete);
}
