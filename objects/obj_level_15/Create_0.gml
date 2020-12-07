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
ds_grid_set_region(map,6,1,6,6,tiletypes.wall);
ds_grid_set_region(map,2,6,5,6,tiletypes.wall);
ds_grid_set_region(map,2,7,2,8,tiletypes.wall);
ds_grid_set_region(map,3,8,8,8,tiletypes.wall);
ds_grid_set_region(map,8,2,8,7,tiletypes.wall);
ds_grid_set_region(map,1,10,8,10,tiletypes.wall);
ds_grid_set_region(map,2,12,2,13,tiletypes.wall);
ds_grid_set_region(map,3,13,4,13,tiletypes.wall);
ds_grid_set_region(map,4,11,4,12,tiletypes.wall);
ds_grid_set_region(map,6,12,6,13,tiletypes.wall);
ds_grid_set_region(map,7,13,8,13,tiletypes.wall);
ds_grid_set_region(map,8,11,8,12,tiletypes.wall);
ds_grid_set_region(map,10,1,10,14,tiletypes.wall);
ds_grid_set_region(map,12,2,14,2,tiletypes.wall);
ds_grid_set_region(map,12,3,12,4,tiletypes.wall);
ds_grid_set_region(map,13,4,13,4,tiletypes.wall);
ds_grid_set_region(map,11,6,14,6,tiletypes.wall);
ds_grid_set_region(map,11,8,13,8,tiletypes.wall);
ds_grid_set_region(map,11,11,12,11,tiletypes.wall);
ds_grid_set_region(map,12,10,12,10,tiletypes.wall);
ds_grid_set_region(map,14,10,14,10,tiletypes.wall);
ds_grid_set_region(map,14,12,14,13,tiletypes.wall);
ds_grid_set_region(map,12,13,13,13,tiletypes.wall);

ds_grid_set_region(map,3,3,3,3,tiletypes.lever_red);
ds_grid_set_region(map,2,11,2,11,tiletypes.gate_red);
ds_grid_set_region(map,11,13,11,13,tiletypes.gate_red_open);
ds_grid_set_region(map,7,12,7,12,tiletypes.lever_green);
ds_grid_set_region(map,1,4,1,4,tiletypes.gate_green);
ds_grid_set_region(map,13,3,13,3,tiletypes.lever_blue);
ds_grid_set_region(map,13,10,13,10,tiletypes.gate_blue);
ds_grid_set_region(map,11,10,11,10,tiletypes.lever_purple);
ds_grid_set_region(map,13,5,13,5,tiletypes.gate_purple);

ds_grid_set(map,14,1,tiletypes.tele_blue);
ds_grid_set(map,3,7,tiletypes.tele_blue);
ds_grid_set(map,11,7,tiletypes.tele_blue);
ds_grid_set(map,3,12,tiletypes.tele_blue);
tele_x = [3,11,3,14];
tele_y = [12,7,7,1];

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);


