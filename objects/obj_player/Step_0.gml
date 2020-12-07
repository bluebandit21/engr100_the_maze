/// @description Inssert description here
// You can write your code in this editor


var level_width = ds_grid_width(level_manager.curr_level.map);
var level_height = ds_grid_height(level_manager.curr_level.map);
	
x = playerx / level_width * global.mazeWidth + global.mazeWidthOffset;
y = playery / level_height * global.mazeHeight + global.mazeHeightOffset;


if (!global.paused) {
	PlayerMovement();
	toggleMaze();
	toggleHint();
}