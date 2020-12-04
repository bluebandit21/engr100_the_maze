// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum tilestatus{
	passable, //Able to move into tile; e.g. empty tile, open gate
	blocked, //Unable to move into tile; e.g. wall, closed gate
	interaction, //Tile modifies level; e.g. lever that opens gate
	mover //Tile moves player somehow.
}
//TODO: BOUNDS CHECKING!
function GetTileStatus(column,row){
	
	var level = level_manager.curr_level;
	var tile = ds_grid_get(level.map,column,row);
	var curr_tile =  ds_grid_get(level_manager.tiles,column,row);
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
		case tiletypes.tele_blue:
		case tiletypes.tele_green:
		case tiletypes.tele_red:
		case tiletypes.ice:
			return tilestatus.mover;
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
			
		case tiletypes.icygate_blue:
		case tiletypes.icygate_blue_open:
			if(curr_tile.open){
				return tilestatus.mover;
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
		case tiletypes.finish:
			if (!global.is_enabled)
				global.lock = global.curr_level_idx + 2;
			next_room();
			break;
		case tiletypes.lever_red:
			curr_tile.flipped = !curr_tile.flipped;
			RedLeverPull();
			break;
		case tiletypes.lever_green:
			curr_tile.flipped = !curr_tile.flipped;
			GreenLeverPull();
			break;
		case tiletypes.lever_blue:
			curr_tile.flipped = !curr_tile.flipped;
			BlueLeverPull();
			break;
		default: 
			break;
	}
}


//Return where player ends up after moving onto tile column, row

function MoveWithTile(curr_player_x,curr_player_y,column, row){
	
	//show_debug_message("Moving with tile at row: " + string(row) + " and col: "+ string(column));
	
	var level = level_manager.curr_level;
	var tile = ds_grid_get(level.map,column,row);
	var curr_tile =  ds_grid_get(level_manager.tiles,column,row);
	
	switch(tile){
		
		case tiletypes.tele_blue:
		case tiletypes.tele_red:
		case tiletypes.tele_green:
			var ret = ds_list_create();
			ds_list_set(ret,0,curr_tile.link_x);
			ds_list_set(ret,1,curr_tile.link_y);
			return ret;
			
		case tiletypes.icygate_blue:
		case tiletypes.icygate_blue_open:
		//If we're interacting with either, the gate is open and we're free to slide.
		case tiletypes.ice:
		
			show_debug_message("Sliding on ice tile at row: " + string(row) + " and col: " + string(column));
			
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
				case tilestatus.interaction:
					var ret = ds_list_create();
					ds_list_set(ret,0,column);
					ds_list_set(ret,1,row);
					return ret;
				case tilestatus.passable:
					var ret = ds_list_create();
					ds_list_set(ret,0,next_tile_x);
					ds_list_set(ret,1,next_tile_y);
					return ret;
				case tilestatus.mover:
					return MoveWithTile(column,row,next_tile_x,next_tile_y);
			}
		default:
			break;
	}
}