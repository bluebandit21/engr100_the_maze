// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RedLeverPull(){
	show_debug_message("Red lever pullled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_red){
				tile.open = !tile.open;
			}
		}
	}
}
function GreenLeverPull(){
	show_debug_message("Green lever pullled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_green){
				tile.open = !tile.open;
			}
		}
	}
}
function BlueLeverPull(){
	show_debug_message("Blue lever pullled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			show_debug_message("Blue loop -- oob write?");
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_blue){
				tile.open = !tile.open;
			}
		}
	}
}