/// @description Insert description here
// You can write your code in this editor
if position_meeting(mouse_x, mouse_y, obj_newgame) {
	if (floor(image_index) == 0)
		room_goto(rm_story);
	else {
		if asset_get_index("obj_level_" + string(global.played + 1)){
			global.curr_level_idx = global.played + 1;
			room_goto(rm_level);
		}
		else{
			global.curr_level_idx = 1;
			room_goto(rm_level);
		}
	}
}
