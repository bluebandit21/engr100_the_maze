/// @description Insert description here
// You can write your code in this editor
var width = 5; // TODO -- Make this not hardcoded?
var height = 5;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,3,3,tiletypes.finish);

ds_grid_set(map,3,1,tiletypes.tele_blue); //First tele -- maps to (2,2)
ds_grid_set(map,2,2,tiletypes.tele_blue);//Second tele -- maps to (3,1)


//List of dest coords for teleporters.
// The order goes in terms of the first pair corresponding to the top-most teleporter of any type, with 
//  succesive pairs following by top-ness, with ties broken by left-ness

tele_x = [2,3];
tele_y = [2,1];