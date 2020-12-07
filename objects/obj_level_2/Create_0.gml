/// @description Insert description here
// You can write your code in this editor
var width = 8; // TODO -- Make this not hardcoded?
var height = 8;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,1,2,2,6,tiletypes.wall);
ds_grid_set_region(map,4,2,6,5,tiletypes.wall);
ds_grid_set_region(map,6,1,6,1,tiletypes.lever_green);
ds_grid_set_region(map,3,4,3,4,tiletypes.gate_green);

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);
instance_create_depth(0, 0, -16000, obj_tutorialscreen);

//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	var ret = ds_list_create();
	if(GetTileStatus(3,4) == tilestatus.blocked){
		//Gate is closed; we must open it with the lever		
		ds_list_set(ret,0,6);
		ds_list_set(ret,1,1);
	}else{
		//Gate is open, we can go to the flag :D
		ds_list_set(ret,0,6);
		ds_list_set(ret,1,6);
	}
	return ret;
}

