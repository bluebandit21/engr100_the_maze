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
ds_grid_set_region(map,1,2,6,2,tiletypes.wall);
ds_grid_set_region(map,6,3,6,8,tiletypes.wall);
ds_grid_set_region(map,4,8,5,8,tiletypes.wall);
ds_grid_set_region(map,4,4,4,7,tiletypes.wall);
ds_grid_set_region(map,2,4,2,10,tiletypes.wall);
ds_grid_set_region(map,3,10,8,10,tiletypes.wall);
ds_grid_set_region(map,8,1,8,9,tiletypes.wall);
ds_grid_set_region(map,1,12,8,12,tiletypes.wall);
ds_grid_set_region(map,1,14,10,14,tiletypes.wall);
ds_grid_set_region(map,10,1,10,13,tiletypes.wall);
ds_grid_set_region(map,11,4,11,4,tiletypes.wall);
ds_grid_set_region(map,12,2,13,2,tiletypes.wall);
ds_grid_set_region(map,13,3,13,4,tiletypes.wall);
ds_grid_set_region(map,14,4,14,4,tiletypes.wall);
ds_grid_set_region(map,12,6,14,6,tiletypes.wall);
ds_grid_set_region(map,12,7,12,11,tiletypes.wall);
ds_grid_set_region(map,13,11,13,11,tiletypes.wall);
ds_grid_set_region(map,12,13,14,13,tiletypes.wall);

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);

ds_grid_set(map,14,3,tiletypes.tele_blue); //First tele -- maps to (2,2)
ds_grid_set(map,1,13,tiletypes.tele_blue);//Second tele -- maps to (3,1)



//List of dest coords for teleporters.
// The order goes in terms of the first pair corresponding to the top-most teleporter of any type, with 
//  succesive pairs following by top-ness, with ties broken by left-ness

tele_x = [1,14];
tele_y = [13,3];