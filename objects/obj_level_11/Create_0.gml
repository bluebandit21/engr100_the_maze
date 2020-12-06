// You can write your code in this editor
var width = 16; // TODO -- Make this not hardcoded?
var height = 16;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,1,2,5,2,tiletypes.wall);
ds_grid_set_region(map,2,4,2,4,tiletypes.wall);
ds_grid_set_region(map,5,3,5,3,tiletypes.wall);
ds_grid_set_region(map,4,4,5,4,tiletypes.wall);
ds_grid_set_region(map,1,6,2,6,tiletypes.wall);
ds_grid_set_region(map,2,7,2,12,tiletypes.wall);
ds_grid_set_region(map,3,12,5,12,tiletypes.wall);
ds_grid_set_region(map,7,1,7,6,tiletypes.wall);
ds_grid_set_region(map,4,6,6,6,tiletypes.wall);
ds_grid_set_region(map,4,7,4,10,tiletypes.wall);
ds_grid_set_region(map,5,10,5,10,tiletypes.wall);
ds_grid_set_region(map,1,14,9,14,tiletypes.wall);
ds_grid_set_region(map,7,12,9,12,tiletypes.wall);
ds_grid_set_region(map,6,8,7,8,tiletypes.wall);
ds_grid_set_region(map,7,9,7,10,tiletypes.wall);
ds_grid_set_region(map,8,10,9,10,tiletypes.wall);
ds_grid_set_region(map,9,2,9,9,tiletypes.wall);
ds_grid_set_region(map,10,2,13,2,tiletypes.wall);
ds_grid_set_region(map,10,4,14,4,tiletypes.wall);
ds_grid_set_region(map,11,6,11,14,tiletypes.wall);
ds_grid_set_region(map,13,5,13,14,tiletypes.wall);

ds_grid_set_region(map,1,7,1,7,tiletypes.lever_green);
ds_grid_set_region(map,12,6,12,6,tiletypes.gate_green);
ds_grid_set_region(map,12,14,12,14,tiletypes.lever_red);
ds_grid_set_region(map,14,2,14,2,tiletypes.gate_red);
ds_grid_set_region(map,8,8,8,8,tiletypes.gate_red_open);
ds_grid_set_region(map,10,3,10,3,tiletypes.lever_blue);
ds_grid_set_region(map,14,9,14,9,tiletypes.gate_blue);
ds_grid_set_region(map,8,9,8,9,tiletypes.lever_purple);
ds_grid_set_region(map,1,13,1,13,tiletypes.gate_purple);
ds_grid_set_region(map,14,8,14,8,tiletypes.gate_purple_open);

ds_grid_set_region(map,1,5,5,5,tiletypes.ice);
ds_grid_set_region(map,5,11,7,11,tiletypes.ice);

ds_grid_set(map,4,3,tiletypes.tele_blue);
ds_grid_set(map,14,5,tiletypes.tele_blue);
tele_x = [14,4];
tele_y = [5,3];

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);