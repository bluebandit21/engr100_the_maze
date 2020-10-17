// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerMovementUp(char){
	with(obj_player){
		if(keyboard_check_pressed(ord(char))){
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
		}
	}
}
function PlayerMovementDown(char){
	with(obj_player){
		if(keyboard_check_pressed(ord(char))){
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
		}
	}
}

function PlayerMovementLeft(char){
	with(obj_player){
		if(keyboard_check_pressed(ord(char))){
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
		}
	}
}

function PlayerMovementRight(char){
	with(obj_player){
		if(keyboard_check_pressed(ord(char))){
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
		}
	}
}