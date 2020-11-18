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
ds_grid_set_region(map,1,2,2,6,tiletypes.wall);
ds_grid_set_region(map,4,1,6,2,tiletypes.wall);
ds_grid_set_region(map,4,4,6,5,tiletypes.wall);

ds_grid_set_region(map,3,2,3,5,tiletypes.ice);

ds_grid_set_region(map,6,3,6,3,tiletypes.lever_blue);
ds_grid_set_region(map,3,4,3,4,tiletypes.icygate_blue);

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);