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
ds_grid_set_region(map,2,1,2,2,tiletypes.wall);
ds_grid_set_region(map,3,2,9,2,tiletypes.wall);
ds_grid_set_region(map,1,4,9,4,tiletypes.wall);
ds_grid_set_region(map,9,5,9,6,tiletypes.wall);
ds_grid_set_region(map,4,6,8,6,tiletypes.wall);
ds_grid_set_region(map,2,6,2,8,tiletypes.wall);
ds_grid_set_region(map,3,8,11,8,tiletypes.wall);
ds_grid_set_region(map,11,1,11,7,tiletypes.wall);
ds_grid_set_region(map,2,10,14,10,tiletypes.wall);
ds_grid_set_region(map,2,11,2,13,tiletypes.wall);
ds_grid_set_region(map,4,12,4,14,tiletypes.wall);
ds_grid_set_region(map,6,11,6,13,tiletypes.wall);
ds_grid_set_region(map,7,13,8,13,tiletypes.wall);
ds_grid_set_region(map,8,12,12,12,tiletypes.wall);
ds_grid_set_region(map,12,13,12,14,tiletypes.wall);
ds_grid_set_region(map,10,14,10,14,tiletypes.wall);
ds_grid_set_region(map,13,2,13,9,tiletypes.wall);
ds_grid_set_region(map,14,2,14,2,tiletypes.wall);
ds_grid_set_region(map,14,12,14,13,tiletypes.wall);

ds_grid_set_region(map,3,1,3,1,tiletypes.lever_green);
ds_grid_set_region(map,1,13,1,13,tiletypes.gate_green);
ds_grid_set_region(map,11,14,11,14,tiletypes.lever_red);
ds_grid_set_region(map,13,6,13,6,tiletypes.gate_red);

ds_grid_set(map,14,3,tiletypes.tele_blue);
ds_grid_set(map,7,12,tiletypes.tele_blue);
tele_x = [7,14];
tele_y = [12,3];

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);