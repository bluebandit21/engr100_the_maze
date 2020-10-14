/// @description Insert description here
// You can write your code in this editor

//Stupidly naieve first implementation.
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
