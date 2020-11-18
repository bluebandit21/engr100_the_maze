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
ds_grid_set_region(map,3,2,6,2,tiletypes.wall);
ds_grid_set_region(map,2,4,8,4,tiletypes.wall);
ds_grid_set_region(map,8,1,8,3,tiletypes.wall);
ds_grid_set_region(map,10,1,10,6,tiletypes.wall);
ds_grid_set_region(map,1,6,2,6,tiletypes.wall);
ds_grid_set_region(map,2,7,2,9,tiletypes.wall);
ds_grid_set_region(map,1,11,4,11,tiletypes.wall);
ds_grid_set_region(map,4,10,4,10,tiletypes.wall);
ds_grid_set_region(map,2,13,5,13,tiletypes.wall);
ds_grid_set_region(map,6,14,6,8,tiletypes.wall);
ds_grid_set_region(map,4,8,5,8,tiletypes.wall);
ds_grid_set_region(map,4,6,4,7,tiletypes.wall);
ds_grid_set_region(map,5,6,8,6,tiletypes.wall);
ds_grid_set_region(map,8,7,8,8,tiletypes.wall);
ds_grid_set_region(map,9,8,13,8,tiletypes.wall);
ds_grid_set_region(map,12,2,12,7,tiletypes.wall);
ds_grid_set_region(map,13,2,13,2,tiletypes.wall);
ds_grid_set_region(map,14,4,14,4,tiletypes.wall);
ds_grid_set_region(map,13,6,13,6,tiletypes.wall);
ds_grid_set_region(map,13,9,13,11,tiletypes.wall);
ds_grid_set_region(map,7,10,11,10,tiletypes.wall);
ds_grid_set_region(map,11,11,11,11,tiletypes.wall);
ds_grid_set_region(map,8,12,9,12,tiletypes.wall);
ds_grid_set_region(map,9,13,9,13,tiletypes.wall);
ds_grid_set_region(map,10,13,14,13,tiletypes.wall);
ds_grid_set_region(map,3,1,3,1,tiletypes.lever_red);
ds_grid_set_region(map,4,9,4,9,tiletypes.gate_red);
ds_grid_set_region(map,5,14,5,14,tiletypes.lever_green);
ds_grid_set_region(map,13,12,13,12,tiletypes.gate_green);
ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);




//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	var ret = ds_list_create();
	if(GetTileStatus(13,12) == tilestatus.passable){
		//Green gate is open, we don't care about the red gate. Go for the goal	
		ds_list_set(ret,0,14);
		ds_list_set(ret,1,14);
	}else if(GetTileStatus(4,9) == tilestatus.passable){
		//Need to hit green lever, but we can reach it.
		ds_list_set(ret,0,5);
		ds_list_set(ret,1,14);
	}else{
		//We need to hit the red lever so we can hit the green
		ds_list_set(ret,0,3);
		ds_list_set(ret,1,1);
	}
	return ret;
}



