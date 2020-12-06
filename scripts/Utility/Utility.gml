// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


enum tiletypes{
	empty,
	start,
	finish,
	wall,
	lever_red,
	gate_red,
	gate_red_open, //gate_red, but starts open instead of shut
	lever_blue,
	gate_blue,
	gate_blue_open, //gate_blue, but starts open instead of shut
	lever_green,
	gate_green,
	gate_green_open, //gate_green, but starts open instead of shut
	gate_purple,
	gate_purple_open,
	lever_purple,
	tele_blue,
	tele_red,
	tele_green,
	ice,
	icygate_blue,
	icygate_blue_open, //icygate_blue, but starts open instead of shut
	icygate_red,
	icygate_red_open, //icygate_red, but starts open instead of shut
	icygate_green,
	icygate_green_open, //icygate_green, but starts open instead of shut
	icygate_purple,
	icygate_purple_open //icygate_purple, but starts open instead of shut
}

function GetTileObjectFromTileType(type){
	switch(type){
		case tiletypes.empty:
			return obj_tile_empty;
		case tiletypes.wall:
			return obj_tile_wall;
		case tiletypes.start:
			return obj_tile_start;
		case tiletypes.finish:
			return obj_tile_finish;
		case tiletypes.lever_red:
			return obj_tile_lever_red;
		case tiletypes.gate_red:
		case tiletypes.gate_red_open:
			return obj_tile_gate_red;
		case tiletypes.gate_blue:
		case tiletypes.gate_blue_open:
			return obj_tile_gate_blue;
		case tiletypes.lever_blue:
			return obj_tile_lever_blue;
		case tiletypes.lever_green:
			return obj_tile_lever_green;
		case tiletypes.gate_green:
		case tiletypes.gate_green_open:
			return obj_tile_gate_green;
		case tiletypes.gate_purple:
		case tiletypes.gate_purple_open:
			return obj_tile_gate_purple;
		case tiletypes.lever_purple:
			return obj_tile_lever_purple;
		case tiletypes.tele_blue:
			return obj_tile_tele_blue;
		case tiletypes.ice:
			return obj_tile_ice;
		case tiletypes.icygate_blue:
		case tiletypes.icygate_blue_open:
			return obj_tile_icygate_blue;
		case tiletypes.icygate_red:
		case tiletypes.icygate_red_open:
			return obj_tile_icygate_red;
		case tiletypes.icygate_green:
		case tiletypes.icygate_green_open:
			return obj_tile_icygate_green;
		case tiletypes.icygate_purple:
		case tiletypes.icygate_purple_open:
			return obj_tile_icygate_purple;
		case tiletypes.tele_green: //Unimplemented
		case tiletypes.tele_red: //Unimplemented
		default:
			show_error("Invalid tiletype encountered",true);
	}
}
globalvar level_manager;
function Initialize(){
	level_manager = instance_create_depth(0,0,0,obj_level_manager);
}