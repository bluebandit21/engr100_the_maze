/// @description Inssert description here
// You can write your code in this editor


var level_width = ds_grid_width(level_manager.curr_level.map);
var level_height = ds_grid_height(level_manager.curr_level.map);
	
x = playerx*room_width / level_width;
y = playery*room_height / level_height;



PlayerMovementUp(string(global.array_of_controls[1]));

PlayerMovementDown(string(global.array_of_controls[2]));

PlayerMovementRight(string(global.array_of_controls[4]));

PlayerMovementLeft(string(global.array_of_controls[3]));

cooldown--;