/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var width = 15; // TODO -- Make this not hardcoded?
var height = 15;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-2,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-2,height-1,tiletypes.wall);

ds_grid_set_region(map,1,2,12,12,tiletypes.ice);

ds_grid_set(map,1,1,tiletypes.start);

ds_grid_set(map,12,1,tiletypes.wall);

ds_grid_set(map,1,2,tiletypes.wall);
ds_grid_set(map,3,2,tiletypes.wall);
ds_grid_set(map,4,2,tiletypes.wall);
ds_grid_set(map,5,2,tiletypes.wall);
ds_grid_set(map,7,2,tiletypes.wall);
ds_grid_set(map,8,2,tiletypes.wall);
ds_grid_set(map,10,2,tiletypes.wall);
ds_grid_set(map,12,2,tiletypes.wall);

ds_grid_set(map,2,4,tiletypes.wall);

ds_grid_set(map,1,5,tiletypes.wall);

ds_grid_set(map,4,7,tiletypes.wall);
ds_grid_set(map,8,7,tiletypes.wall);
ds_grid_set(map,12,7,tiletypes.wall);

ds_grid_set(map,3,8,tiletypes.wall);
ds_grid_set(map,9,8,tiletypes.wall);
ds_grid_set(map,10,8,tiletypes.wall);
ds_grid_set(map,11,8,tiletypes.wall);

ds_grid_set(map,5,9,tiletypes.wall);
ds_grid_set(map,11,9,tiletypes.wall);

ds_grid_set(map,1,10,tiletypes.wall);
ds_grid_set(map,5,10,tiletypes.wall);
ds_grid_set(map,6,10,tiletypes.wall);

ds_grid_set(map,2,10,tiletypes.wall);
ds_grid_set(map,4,10,tiletypes.wall);
ds_grid_set(map,11,11,tiletypes.wall);

ds_grid_set(map,7,12,tiletypes.wall);
ds_grid_set(map,9,12,tiletypes.wall);
ds_grid_set(map,10,12,tiletypes.wall);

ds_grid_set(map,8,12,tiletypes.ice);
ds_grid_set(map,8,13,tiletypes.finish);


//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	//We can always go for the flag.
	var ret = ds_list_create();
	ds_list_set(ret,0,8);
	ds_list_set(ret,1,12);	
	return ret;
}
