// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum tilestatus{
	passable, //Able to move into tile; e.g. empty tile, open gate
	blocked, //Unable to move into tile; e.g. wall, closed gate
	interaction //Tile does something; e.g. lever that opens gate
}
//TODO: BOUNDS CHECKING!
function GetTileStatus(row,column){
	var level = level_manager.curr_level;
	var tile = ds_grid_get(level.map,row,column);
	var curr_tile =  ds_grid_get(level_manager.tiles,row,column);
	switch(tile){
		case tiletypes.empty:
		case tiletypes.start:
			return tilestatus.passable;
		case tiletypes.wall:
			return tilestatus.blocked;
		case tiletypes.finish:
		case tiletypes.lever_red:
		case tiletypes.lever_green:
		case tiletypes.lever_blue:
			return tilestatus.interaction;
		case tiletypes.gate_red:
		case tiletypes.gate_blue:
		case tiletypes.gate_green:
			if(curr_tile.open){
				return tilestatus.passable;
			}
			return tilestatus.blocked;
		default:
			show_error("Unknown tiletype: "+string(tile),true);
	}
}
function InteractWithTile(row,column){
	var level = level_manager.curr_level;
	var tile = ds_grid_get(level.map,row,column);
	var curr_tile =  ds_grid_get(level_manager.tiles,row,column);
	switch(tile){
		case tiletypes.empty:
		case tiletypes.start:
		case tiletypes.wall:
		case tiletypes.gate_red:
			//Fall-through
			break;
		case tiletypes.finish:
			//TODO: CHANGE!
			show_message("YAY, YOU WON!\n(This won't quit the game in the non-demo, xD)");
			room_goto(rm_levelselect);
			break;
		case tiletypes.lever_red:
			RedLeverPull();
			break;
		case tiletypes.lever_green:
			GreenLeverPull();
			break;
		case tiletypes.lever_blue:
			BlueLeverPull();
			break;
	
			
	}
}