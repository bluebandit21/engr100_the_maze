// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_input(keyDirection, controlNumber){
	var i_d = ds_map_find_value(async_load,"id");
	if(i_d == keyDirection){
		if ds_map_find_value(async_load, "status")
	      {

					localDirection = ds_map_find_value(async_load, "result");
					if(check_controls(string(localDirection), global.array_of_controls))
						global.array_of_controls[controlNumber] = string_upper(localDirection);
					else
						show_message("Key already assigned");
		  
		}
	}
}

function determine_switch(determiner){
	switch (determiner){
		case 1:
			find_input(obj_rebindable_up.upKey, 1);
			break;
		case 2:
			find_input(obj_rebindable_down.downKey,2);
			break;
		case 3:
			find_input(obj_rebindable_left.leftKey, 3);
			break;
		case 4:
			find_input(obj_rebindable_right.rightKey, 4);
			break;
		default:
			break;		
	}
}

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
	var name = asset_get_index("obj_level_" + string(global.curr_level_idx + 1));
	if name > -1 {
		global.curr_level_idx++;
		room_goto(rm_level);
	}
	else
		room_goto(rm_levelselect);
}
