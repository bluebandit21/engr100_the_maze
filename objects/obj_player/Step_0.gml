/// @description Inssert description here
// You can write your code in this editor


var level_width = ds_grid_width(level_manager.curr_level.map);
var level_height = ds_grid_height(level_manager.curr_level.map);
	
x = playerx / level_width * global.mazeWidth + global.mazeWidthOffset;
y = playery / level_height * global.mazeHeight + global.mazeHeightOffset;

toggleMaze();

PlayerMovementUp(global.array_of_controls[1]);

PlayerMovementDown(global.array_of_controls[2]);

PlayerMovementRight(global.array_of_controls[4]);

PlayerMovementLeft(global.array_of_controls[3]);



cooldown--;