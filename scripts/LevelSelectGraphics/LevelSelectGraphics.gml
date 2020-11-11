// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function maze_sprite(number){
	name = asset_get_index("spr_level_" + string(number));
	if name > -1 {
		object_set_sprite(obj_mazepreview, name);
	}
}