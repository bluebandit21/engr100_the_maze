/// @description Insert description here
// You can write your code in this editor
var width = 8; // TODO -- Make this not hardcoded?
var height = 8;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,1,2,1,2,tiletypes.wall);
ds_grid_set_region(map,2,2,5,5,tiletypes.wall);
ds_grid_set_region(map,6,5,6,5,tiletypes.wall);

ds_grid_set(map,1,3,tiletypes.tele_blue);
ds_grid_set(map,6,4,tiletypes.tele_blue);
tele_x = [6,1];
tele_y = [4,3];

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);

if (global.lock == 7) {
	instance_create_depth(0, 0, -16000, obj_tutorialscreen);
}