// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function specific_room_goto(current_room){
	if(current_room == "rm_controls"){
		room_goto(rm_options);
		instance_destroy(obj_rebindable_up);
		instance_destroy(obj_rebindable_down);
		instance_destroy(obj_rebindable_left);
		instance_destroy(obj_rebindable_right);
	}
	else
		room_goto(rm_titlescreen);
}

function next_room() {
	global.isLevelLoaded = false;
	var name = asset_get_index("obj_level_" + string(global.curr_level_idx + 1));
	if name > -1 {
		global.curr_level_idx++;
		global.maze_toggled = false;
		global.maze_on = true;
		room_goto(rm_level);
	}
	else
		room_goto(rm_levelselect);
}
