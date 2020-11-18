
var width = 16; // TODO -- Make this not hardcoded?
var height = 16;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,2,2,2,7,tiletypes.wall);
ds_grid_set_region(map,1,7,6,7,tiletypes.wall);
ds_grid_set_region(map,4,2,13,2,tiletypes.wall);
ds_grid_set_region(map,4,3,4,5,tiletypes.wall);
ds_grid_set_region(map,5,5,6,5,tiletypes.wall);
ds_grid_set_region(map,6,4,7,4,tiletypes.wall);
ds_grid_set_region(map,9,3,9,13,tiletypes.wall);
ds_grid_set_region(map,1,13,8,13,tiletypes.wall);
ds_grid_set_region(map,8,6,8,6,tiletypes.wall);
ds_grid_set_region(map,1,12,1,12,tiletypes.wall);
ds_grid_set_region(map,5,12,5,12,tiletypes.wall);
ds_grid_set_region(map,4,8,4,8,tiletypes.wall);
ds_grid_set_region(map,6,8,7,8,tiletypes.wall);
ds_grid_set_region(map,7,9,7,11,tiletypes.wall);
ds_grid_set_region(map,2,10,6,10,tiletypes.wall);
ds_grid_set_region(map,3,11,3,11,tiletypes.wall);
ds_grid_set_region(map,2,9,2,9,tiletypes.wall);
ds_grid_set_region(map,11,4,14,4,tiletypes.wall);
ds_grid_set_region(map,11,5,11,8,tiletypes.wall);
ds_grid_set_region(map,12,8,13,8,tiletypes.wall);
ds_grid_set_region(map,13,6,13,7,tiletypes.wall);
ds_grid_set_region(map,11,10,14,10,tiletypes.wall);
ds_grid_set_region(map,11,12,11,14,tiletypes.wall);
ds_grid_set_region(map,13,12,13,14,tiletypes.wall);
ds_grid_set_region(map,6,9,6,9,tiletypes.lever_red);
ds_grid_set_region(map,11,11,11,11,tiletypes.gate_red);
ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);
instance_create_depth(0, 0, -16000, obj_tutorialscreen);