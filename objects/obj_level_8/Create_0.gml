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
ds_grid_set_region(map,4,3,4,4,tiletypes.wall);
ds_grid_set_region(map,2,4,3,4,tiletypes.wall);
ds_grid_set_region(map,2,5,2,6,tiletypes.wall);
ds_grid_set_region(map,2,8,2,13,tiletypes.wall);
ds_grid_set_region(map,3,8,4,8,tiletypes.wall);
ds_grid_set_region(map,4,9,4,9,tiletypes.wall);
ds_grid_set_region(map,4,11,4,14,tiletypes.wall);
ds_grid_set_region(map,4,6,6,6,tiletypes.wall);
ds_grid_set_region(map,4,7,4,7,tiletypes.wall);
ds_grid_set_region(map,6,2,6,5,tiletypes.wall);
ds_grid_set_region(map,7,2,8,2,tiletypes.wall);
ds_grid_set_region(map,8,3,8,13,tiletypes.wall);
ds_grid_set_region(map,6,8,6,14,tiletypes.wall);
ds_grid_set_region(map,7,8,7,8,tiletypes.wall);
ds_grid_set_region(map,10,1,10,7,tiletypes.wall);
ds_grid_set_region(map,11,7,12,7,tiletypes.wall);
ds_grid_set_region(map,12,2,12,6,tiletypes.wall);
ds_grid_set_region(map,13,2,13,2,tiletypes.wall);
ds_grid_set_region(map,14,4,14,8,tiletypes.wall);
ds_grid_set_region(map,10,9,14,9,tiletypes.wall);
ds_grid_set_region(map,10,11,10,14,tiletypes.wall);
ds_grid_set_region(map,11,11,13,11,tiletypes.wall);
ds_grid_set_region(map,12,13,14,13,tiletypes.wall);

ds_grid_set_region(map, 9,7,9,11, tiletypes.ice);
ds_grid_set(map,7,9,tiletypes.lever_green);
ds_grid_set(map,13,7,tiletypes.gate_green);
ds_grid_set(map,3,3,tiletypes.lever_red);
ds_grid_set(map,2,14,tiletypes.gate_red);
ds_grid_set(map,7,3,tiletypes.lever_blue);
ds_grid_set(map,9,9,tiletypes.icygate_blue_open);

ds_grid_set(map,11,1,tiletypes.tele_blue);
ds_grid_set(map,10,10,tiletypes.tele_blue);
tele_x = [10,11];
tele_y = [10,1];



ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);