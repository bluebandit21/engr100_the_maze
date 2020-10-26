// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.adjust_speed = 9;

function PlayerMovementUp(char){
	with(obj_player){
		if(keyboard_check(ord(char)) && (cooldown < 1)){
			var status=GetTileStatus(playerx, playery-1);
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playery-=1;
					break;
				case tilestatus.interaction:
					InteractWithTile(playerx, playery-1);
					break;
		}
		cooldown = global.adjust_speed;
		}
	}
}
function PlayerMovementDown(char){
	with(obj_player){
			if(keyboard_check(ord(char)) && (cooldown < 1)){
			var status=GetTileStatus(playerx,playery+1);
			switch(status){
			case tilestatus.blocked:
				break;
			case tilestatus.passable:
				playery+=1;
				break;
			case tilestatus.interaction:
				InteractWithTile(playerx,playery+1);
				break;
			}
			cooldown = global.adjust_speed;
			}
		}
	}


function PlayerMovementLeft(char){
	with(obj_player){
		if(keyboard_check(ord(char)) && (cooldown < 1)){
		var status=GetTileStatus(playerx-1,playery);
		switch(status){
			case tilestatus.blocked:
				break;
			case tilestatus.passable:
				playerx-=1;
				break;
			case tilestatus.interaction:
				InteractWithTile(playerx-1,playery);
				break;
		}
		cooldown = global.adjust_speed
		}
	}
}

function PlayerMovementRight(char){
	with(obj_player){
		if(keyboard_check(ord(char)) && (cooldown < 1)){
		var status=GetTileStatus(playerx+1,playery);
		switch(status){
			case tilestatus.blocked:
				break;
			case tilestatus.passable:
				playerx+=1;
				break;
			case tilestatus.interaction:
				InteractWithTile(playerx+1,playery);
				break;
		}
		cooldown = global.adjust_speed;
		}
	}
}