/// @description Insert description here
// You can write your code in this editor

var width = 6; // TODO -- Make this not hardcoded?
var height = 8;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);


ds_grid_set(map,4,1,tiletypes.lever_red);
ds_grid_set(map,4,2,tiletypes.lever_green);
ds_grid_set(map,4,3,tiletypes.lever_blue);

ds_grid_set(map,1,3,tiletypes.gate_red);
ds_grid_set(map,1,4,tiletypes.gate_green_open);
ds_grid_set(map,1,5,tiletypes.gate_blue);
ds_grid_set_region(map,2,3,2,6,tiletypes.wall);
ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,1,6,tiletypes.finish);

