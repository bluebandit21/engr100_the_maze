/// @description Insert description here
// You can write your code in this editor

//Stupidly naieve first implementation.
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
