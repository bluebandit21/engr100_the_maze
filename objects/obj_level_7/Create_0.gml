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

ds_grid_set_region(map, 3,3,5,6, tiletypes.ice);
ds_grid_set_region(map, 4,4,4,4, tiletypes.empty);


ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);