// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function removeArrows(){
	while(instance_number(obj_maze_solver_arrow) > 0){
			instance_destroy(instance_find(obj_maze_solver_arrow,0));
		}
}

function toggleMaze(){
	toggled = keyboard_check_pressed(ord(global.array_of_controls[5]));
	if toggled && global.maze_on {
		global.maze_toggled = true;
		global.maze_on = false;
		if(global.isLevelLoaded){
			solveMaze();
		}
		toggled = false;
	}

	if toggled && !global.maze_on {
		global.maze_toggled = false;
		global.maze_on = true;
		
		toggled = false;
		removeArrows();
	}
}

function PlayerMovementUp(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_up)) && (cooldown < 1)){
			var status=GetTileStatus(playerx, playery-1);
			var type = ds_grid_get(level_manager.curr_level.map,playerx,playery-1);
			switch(type){
				case tiletypes.tele_blue:
				case tiletypes.tele_green:
				case tiletypes.tele_red:
			        audio_play_sound(sound_teleporter, 0, false);
			        break;
				case tiletypes.ice:
					audio_play_sound(sound_ice, 0, false);
			        break;
			}
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playery-=1;
					break;
				case tilestatus.interaction:
					InteractWithTile(playerx,playery-1);
					break;
				case tilestatus.mover:				
					var ret = MoveWithTile(level_manager.player.playerx,level_manager.player.playery, playerx,playery-1);
					level_manager.player.playerx = ds_list_find_value(ret,0);
					level_manager.player.playery = ds_list_find_value(ret,1);
					break;
				}
		cooldown = global.adjust_speed;
		if(global.maze_toggled)
			solveMaze();
		if(global.hint_toggled)
			giveMazeHint();
		}
	}
}
function PlayerMovementDown(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_down)) && (cooldown < 1)){
			var status=GetTileStatus(playerx,playery+1);
			var type = ds_grid_get(level_manager.curr_level.map,playerx,playery+1);
			switch(type){
				case tiletypes.tele_blue:
				case tiletypes.tele_green:
				case tiletypes.tele_red:
			        audio_play_sound(sound_teleporter, 0, false);
			        break;
				case tiletypes.ice:
					audio_play_sound(sound_ice, 0, false);
			        break;
			}
			switch(status){
			case tilestatus.blocked:
				break;
			case tilestatus.passable:
				playery+=1;
				break;
			case tilestatus.interaction:
				InteractWithTile(playerx,playery+1);
				break;
			case tilestatus.mover:			
				var ret = MoveWithTile(level_manager.player.playerx,level_manager.player.playery, playerx,playery+1);
				level_manager.player.playerx = ds_list_find_value(ret,0);
				level_manager.player.playery = ds_list_find_value(ret,1);
				break;
			}
			cooldown = global.adjust_speed;
			if(global.maze_toggled)
				solveMaze();
			if(global.hint_toggled)
				giveMazeHint();
			}
			
		}
	}


function PlayerMovementLeft(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_left)) && (cooldown < 1)){
			var status=GetTileStatus(playerx-1,playery);
			var type = ds_grid_get(level_manager.curr_level.map,playerx-1,playery);
			switch(type){
				case tiletypes.tele_blue:
				case tiletypes.tele_green:
				case tiletypes.tele_red:
			        audio_play_sound(sound_teleporter, 0, false);
			        break;
				case tiletypes.ice:
					audio_play_sound(sound_ice, 0, false);
			        break;
			}
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playerx-=1;
					break;
				case tilestatus.interaction:
					InteractWithTile( playerx-1, playery);
					break;
				case tilestatus.mover:
					var ret = MoveWithTile(level_manager.player.playerx,level_manager.player.playery, playerx-1,playery);		
					level_manager.player.playerx = ds_list_find_value(ret,0);
					level_manager.player.playery = ds_list_find_value(ret,1);
					break;
			}
			cooldown = global.adjust_speed
			if(global.maze_toggled)
				solveMaze();
			if(global.hint_toggled)
				giveMazeHint();
		}
			
	}
}

function PlayerMovementRight(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_right)) && (cooldown < 1)){
			var status=GetTileStatus(playerx+1,playery);
			var type = ds_grid_get(level_manager.curr_level.map,playerx+1,playery);
			switch(type){
				case tiletypes.tele_blue:
				case tiletypes.tele_green:
				case tiletypes.tele_red:
			        audio_play_sound(sound_teleporter, 0, false);
			        break;
				case tiletypes.ice:
					audio_play_sound(sound_ice, 0, false);
			        break;
			}
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playerx+=1;
					break;
				case tilestatus.interaction:
					InteractWithTile(playerx + 1,playery);
					break;
				case tilestatus.mover:
					var ret = MoveWithTile(level_manager.player.playerx,level_manager.player.playery, playerx+1,playery);
					level_manager.player.playerx = ds_list_find_value(ret,0);
					level_manager.player.playery = ds_list_find_value(ret,1);
					break;
			}
			cooldown = global.adjust_speed;
			if(global.maze_toggled)
				solveMaze();
			if(global.hint_toggled)
				giveMazeHint();
		}
		
	}
}