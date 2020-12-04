// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

cooldowns = array_create(4); //[Up, Down, Left, Right]
pressTimes = array_create(4); //[Up, Down, Left, Right]
pressTimes[0] = 0;
pressTimes[1] = 0;
pressTimes[2] = 0;
pressTimes[3] = 0;
holdTime = 10; //Adjust me!

function GetKey(key){ //[Up, Down, Left, Right] = 0,1,2,3
	return string(global.array_of_controls[key]);
}
	

function PlayerMovement(){
	PlayerMovementUp(GetKey(0));
	PlayerMovementDown(GetKey(1));
	PlayerMovementLeft(GetKey(2));
	PlayerMovementRight(GetKey(3));
	for(i=0;i<4;i++){
		cooldowns[i]--;
	}
}

function CheckIfHeld(key){ //[Up, Down, Left, Right] = 0,1,2,3
	if(keyboard_check(GetKey(key))){
		//Keyboard is being held.
		pressTimes[key]+=1;
	}else{
		pressTimes[key] = 0;
	}
	return pressTimes[key] > holdTime;
}


function PlayerMovementUp(){
	with(obj_player){
		if(CheckIfHeld(GetKey(0)) && (cooldowns[0] < 1)){
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
		cooldowns[0] = global.adjust_speed;
		if(global.maze_toggled)
			solveMaze();
		if(global.hint_toggled)
			giveMazeHint();
		}
	}
}
function PlayerMovementDown(){
	with(obj_player){
		if((keyboard_check(GetKey(1))) && (cooldowns[1] < 1)){
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
			cooldowns[1] = global.adjust_speed;
			if(global.maze_toggled)
				solveMaze();
			if(global.hint_toggled)
				giveMazeHint();
			}
			
		}
	}


function PlayerMovementLeft(){
	with(obj_player){
		if(keyboard_check(GetKey(2)) && (cooldowns[2] < 1)){
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
			cooldowns[2] = global.adjust_speed
			if(global.maze_toggled)
				solveMaze();
			if(global.hint_toggled)
				giveMazeHint();
		}
			
	}
}

function PlayerMovementRight(){
	with(obj_player){
		if(keyboard_check(GetKey[3]) && (cooldowns[3] < 1)){
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
			cooldowns[3] = global.adjust_speed;
			if(global.maze_toggled)
				solveMaze();
			if(global.hint_toggled)
				giveMazeHint();
		}
		
	}
}

function toggleMaze(){
	toggled = keyboard_check_pressed(ord(global.array_of_controls[4]));
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