// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.cooldowns = array_create(4); //[Up, Down, Left, Right]
for(i=0;i<4;i++){
		global.cooldowns[i]=0;
	}
global.pressTimes = array_create(4); //[Up, Down, Left, Right]
for(i=0;i<4;i++){
		global.pressTimes[i]=0;
	}
global.holdTime = 10; //Adjust me!

function GetKey(key){ //[Up, Down, Left, Right] = 0,1,2,3
	return global.array_of_controls[key];
}
	

function PlayerMovement(){
	PlayerMovementUp(GetKey(0));
	PlayerMovementDown(GetKey(1));
	PlayerMovementLeft(GetKey(2));
	PlayerMovementRight(GetKey(3));
	for(i=0;i<4;i++){
		global.cooldowns[i]--;
	}
}

function CheckIfHeld(key){ //[Up, Down, Left, Right] = 0,1,2,3
	if(keyboard_check(GetKey(key))){
		//Keyboard is being held.
		global.pressTimes[key]+=1;
	}else{
		global.pressTimes[key] = 0;
	}
	return global.pressTimes[key] > global.holdTime;
}

function PulseSolvers(){
	if(global.isMazeToggled){
		solveMaze();
	}
	if(global.isHintToggled){
		giveMazeHint();
	}
}

function PlayerMovementUp(){
		if((CheckIfHeld(0) && (global.cooldowns[0] < 1)) || (global.pressTimes[0] == 1)){
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
		global.cooldowns[0] = global.adjust_speed;
		PulseSolvers();
	}
}
function PlayerMovementDown(){
	
		if((CheckIfHeld(1) && (global.cooldowns[1] < 1)) || (global.pressTimes[1] == 1)){
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
			global.cooldowns[1] = global.adjust_speed;
			PulseSolvers();
		}
			
		
}


function PlayerMovementLeft(){
	
		if((CheckIfHeld(2) && (global.cooldowns[2] < 1)) || (global.pressTimes[2] == 1)){
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
			global.cooldowns[2] = global.adjust_speed
			PulseSolvers();
		}
			
	
}

function PlayerMovementRight(){
		if((CheckIfHeld(3) && (global.cooldowns[3] < 1)) || (global.pressTimes[3] == 1)){
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
			global.cooldowns[3] = global.adjust_speed;
			PulseSolvers();
		}
		
	
}
