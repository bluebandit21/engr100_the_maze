// Functions that handle global state change 
// (i.e. interactions whose effects should somehow be broadcast to specific tiles)
function RedLeverPull(){
	// Do red lever pull event -- plays a sound and toggles state of all red gates.
	audio_play_sound(sound_lever, 0, false);
	show_debug_message("Red lever pulled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_red || type == tiletypes.gate_red_open
			|| type == tiletypes.icygate_red || type == tiletypes.icygate_red_open){
				tile.open = !tile.open;
			}
		}
	}
}
function GreenLeverPull(){
	// Do green lever pull event -- plays a sound and toggles state of all green gates.
	audio_play_sound(sound_lever, 0, false);
	show_debug_message("Green lever pulled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_green || type == tiletypes.gate_green_open
			|| type == tiletypes.icygate_green || type == tiletypes.icygate_green_open){
				tile.open = !tile.open;
			}
		}
	}
}
function BlueLeverPull(){
	// Do blue lever pull event -- plays a sound and toggles state of all blue gates.
	audio_play_sound(sound_lever, 0, false);
	show_debug_message("Blue lever pulled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_blue || type == tiletypes.gate_blue_open
				|| type == tiletypes.icygate_blue || type == tiletypes.icygate_blue_open){
				tile.open = !tile.open; 
			}
		}
	}
}

function PurpleLeverPull(){
	// Do purple lever pull event -- plays a sound and toggles state of all purple gates.
	audio_play_sound(sound_lever, 0, false);
	show_debug_message("Purple lever pulled");
	var level_width = ds_grid_width(level_manager.curr_level.map);
	var level_height = ds_grid_height(level_manager.curr_level.map);

	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			tile = ds_grid_get(level_manager.tiles,row,col);
			type = ds_grid_get(level_manager.curr_level.map,row,col);
			if(type == tiletypes.gate_purple || type == tiletypes.gate_purple_open
				|| type == tiletypes.icygate_purple || type == tiletypes.icygate_purple_open){
				tile.open = !tile.open; 
			}
		}
	}
}