// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum tilestatus{
	passable, //Able to move into tile; e.g. empty tile, open gate
	blocked, //Unable to move into tile; e.g. wall, closed gate
	interaction //Tile does something; e.g. lever that opens gate
}
//TODO: BOUNDS CHECKING!
function GetTileStatus(column,row){
	
	var level = level_manager.curr_level;
	var tile = ds_grid_get(level.map,column,row);
	var curr_tile =  ds_grid_get(level_manager.tiles,column,row);
	if (global.paused) {
		return tilestatus.blocked;
	}
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
		case tiletypes.tele_blue:
		case tiletypes.tele_green:
		case tiletypes.tele_red:
		case tiletypes.ice:
			return tilestatus.interaction;
		case tiletypes.gate_red:
		case tiletypes.gate_red_open:
		case tiletypes.gate_blue:
		case tiletypes.gate_blue_open:
		case tiletypes.gate_green:
		case tiletypes.gate_green_open:
			if(curr_tile.open){
				return tilestatus.passable;
			}
			return tilestatus.blocked;
		default:
			show_error("Unknown tiletype: "+string(tile),true);
	}
}
function InteractWithTile(column,row){
	
	show_debug_message("Interacting with tile at row: " + string(row) + " and col: "+ string(column));
	
	var level = level_manager.curr_level;
	var tile = ds_grid_get(level.map,column,row);
	var curr_tile =  ds_grid_get(level_manager.tiles,column,row);
	switch(tile){
		case tiletypes.empty:
		case tiletypes.start:
		case tiletypes.wall:
		case tiletypes.gate_red:
			//Fall-through
			break;
		case tiletypes.finish:
			global.lock = global.curr_level_idx + 2;
			next_room();
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
		case tiletypes.tele_blue:
		case tiletypes.tele_red:
		case tiletypes.tele_green:
			level_manager.player.playerx = curr_tile.link_x;
			level_manager.player.playery = curr_tile.link_y;
			break;
		case tiletypes.ice:
		
			show_debug_message("Sliding on ice tile at row: " + string(row) + " and col: " + string(column));
			var curr_player_x = level_manager.player.playerx;
			var curr_player_y = level_manager.player.playery;
			
			//Slide onto tile
			level_manager.player.playerx = column;
			level_manager.player.playery = row;
			
			var delta_x = column - curr_player_x;
			var delta_y = row - curr_player_y;
			
			show_debug_message("Sliding delta_x: " + string(delta_x));
			show_debug_message("Sliding delta_y: " + string(delta_y));
			
			var next_tile_x = delta_x + column;
			var next_tile_y = delta_y + row;
			
			
			var next_tile_status = GetTileStatus(next_tile_x,next_tile_y);
			
			show_debug_message("Trying to slide to row: " + string(next_tile_y) + " and col: " + string(next_tile_x)); 
			
			switch(next_tile_status){
				case tilestatus.blocked:
				
					break; //We hit something (like a wall)
				case tilestatus.passable:
					level_manager.player.playerx = next_tile_x;
					level_manager.player.playery = next_tile_y;
					break;
				case tilestatus.interaction:
					InteractWithTile(next_tile_x,next_tile_y);
					break;
			}
			break;
		default: 
			break;
	
			
	}
}