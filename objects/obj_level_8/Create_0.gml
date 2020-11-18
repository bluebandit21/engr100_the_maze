/// @description Insert description here
// You can write your code in this editor

var width = 16; // TODO -- Make this not hardcoded?
var height = 16;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,1,2,4,2,tiletypes.wall);
ds_grid_set_region(map,2,4,6,4,tiletypes.wall);
ds_grid_set_region(map,6,1,6,3,tiletypes.wall);
ds_grid_set_region(map,1,6,6,6,tiletypes.wall);
ds_grid_set_region(map,6,7,6,8,tiletypes.wall);
ds_grid_set_region(map,2,8,3,8,tiletypes.wall);
ds_grid_set_region(map,3,9,3,11,tiletypes.wall);
ds_grid_set_region(map,1,10,1,11,tiletypes.wall);
ds_grid_set_region(map,2,11,2,11,tiletypes.wall);
ds_grid_set_region(map,2,13,3,13,tiletypes.wall);
ds_grid_set_region(map,7,8,7,11,tiletypes.wall);
ds_grid_set_region(map,5,10,5,11,tiletypes.wall);
ds_grid_set_region(map,6,11,6,11,tiletypes.wall);
ds_grid_set_region(map,5,13,8,13,tiletypes.wall);
ds_grid_set_region(map,8,1,8,4,tiletypes.wall);
ds_grid_set_region(map,9,4,9,4,tiletypes.wall);
ds_grid_set_region(map,8,6,9,6,tiletypes.wall);
ds_grid_set_region(map,9,7,9,14,tiletypes.wall);
ds_grid_set_region(map,10,2,13,2,tiletypes.wall);
ds_grid_set_region(map,13,3,13,4,tiletypes.wall);
ds_grid_set_region(map,11,4,12,4,tiletypes.wall);
ds_grid_set_region(map,11,6,14,6,tiletypes.wall);
ds_grid_set_region(map,11,7,11,13,tiletypes.wall);
ds_grid_set_region(map,13,8,13,14,tiletypes.wall);

ds_grid_set_region(map, 8,5,13,5, tiletypes.ice);
ds_grid_set_region(map, 2,12,7,12, tiletypes.ice);

ds_grid_set_region(map,2,10,2,10,tiletypes.lever_green);
ds_grid_set_region(map,10,10,10,10,tiletypes.gate_green);


ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);