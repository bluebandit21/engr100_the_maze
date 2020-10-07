/// @description Insert description here
// You can write your code in this editor
var width = 5; // TODO -- Make this not hardcoded?
var height = 5;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width,height,tiletypes.empty);
ds_grid_set(map,0,0,tiletypes.wall);