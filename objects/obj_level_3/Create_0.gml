/// @description Insert description here
// You can write your code in this editor

var width = 6; // TODO -- Make this not hardcoded?
var height = 6;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);


ds_grid_set(map,3,1,tiletypes.lever_red);
ds_grid_set(map,1,3,tiletypes.gate_red);
ds_grid_set(map,1,1,tiletypes.start);
