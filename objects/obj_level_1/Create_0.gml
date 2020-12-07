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
ds_grid_set_region(map,6,2,7,2,tiletypes.wall);
ds_grid_set_region(map,9,2,11,2,tiletypes.wall);
ds_grid_set_region(map,13,2,14,2,tiletypes.wall);
ds_grid_set_region(map,2,3,2,3,tiletypes.wall);
ds_grid_set_region(map,6,3,6,3,tiletypes.wall);
ds_grid_set_region(map,9,3,9,3,tiletypes.wall);
ds_grid_set_region(map,13,3,13,3,tiletypes.wall);
ds_grid_set_region(map,2,4,2,4,tiletypes.wall);
ds_grid_set_region(map,4,4,6,4,tiletypes.wall);
ds_grid_set_region(map,8,4,9,4,tiletypes.wall);
ds_grid_set_region(map,11,4,11,4,tiletypes.wall);
ds_grid_set_region(map,13,4,13,4,tiletypes.wall);
ds_grid_set_region(map,2,5,2,5,tiletypes.wall);
ds_grid_set_region(map,4,5,4,5,tiletypes.wall);
ds_grid_set_region(map,8,5,8,5,tiletypes.wall);
ds_grid_set_region(map,11,5,13,5,tiletypes.wall);
ds_grid_set_region(map,4,6,4,6,tiletypes.wall);
ds_grid_set_region(map,6,6,8,6,tiletypes.wall);
ds_grid_set_region(map,2,7,6,7,tiletypes.wall);
ds_grid_set_region(map,11,7,11,7,tiletypes.wall);
ds_grid_set_region(map,13,7,13,7,tiletypes.wall);
ds_grid_set_region(map,2,8,2,8,tiletypes.wall);
ds_grid_set_region(map,9,8,13,8,tiletypes.wall);
ds_grid_set_region(map,2,9,7,9,tiletypes.wall);
ds_grid_set_region(map,9,9,9,9,tiletypes.wall);
ds_grid_set_region(map,13,9,13,9,tiletypes.wall);
ds_grid_set_region(map,7,10,7,10,tiletypes.wall);
ds_grid_set_region(map,9,10,9,10,tiletypes.wall);
ds_grid_set_region(map,11,10,11,10,tiletypes.wall);
ds_grid_set_region(map,13,10,13,10,tiletypes.wall);
ds_grid_set_region(map,2,11,5,11,tiletypes.wall);
ds_grid_set_region(map,7,11,7,11,tiletypes.wall);
ds_grid_set_region(map,9,11,9,11,tiletypes.wall);
ds_grid_set_region(map,11,11,11,11,tiletypes.wall);
ds_grid_set_region(map,13,11,13,11,tiletypes.wall);
ds_grid_set_region(map,2,12,2,12,tiletypes.wall);
ds_grid_set_region(map,5,12,5,12,tiletypes.wall);
ds_grid_set_region(map,7,12,9,12,tiletypes.wall);
ds_grid_set_region(map,11,12,11,12,tiletypes.wall);
ds_grid_set_region(map,13,12,13,12,tiletypes.wall);
ds_grid_set_region(map,2,13,2,13,tiletypes.wall);
ds_grid_set_region(map,4,13,5,13,tiletypes.wall);
ds_grid_set_region(map,11,13,11,13,tiletypes.wall);
ds_grid_set_region(map,13,13,14,13,tiletypes.wall);
ds_grid_set_region(map,2,14,2,14,tiletypes.wall);
ds_grid_set_region(map,7,14,11,14,tiletypes.wall);
ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);
if (global.played < 1) {
	instance_create_depth(0, 0, -16000, obj_tutorialscreen);
}


//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	//Always return the flag; we can always reach it.
	var ret = ds_list_create();
	ds_list_set(ret,0,14);
	ds_list_set(ret,1,14);
	return ret;
}
