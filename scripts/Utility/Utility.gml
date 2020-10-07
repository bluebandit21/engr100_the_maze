// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


enum tiletypes{
	empty,
	wall
}

function GetTileObjectFromTileType(type){
	switch(type){
		case tiletypes.empty:
			return obj_tile_empty;
		case tiletypes.wall:
			return obj_tile_wall;
		default:
			show_error("Invalid tiletype encountered",true);
	}
}

function Initialize(){
	globalvar level_manager;
	level_manager = instance_create_depth(0,0,0,obj_level_manager);
}