/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var width = 12; // TODO -- Make this not hardcoded?
var height = 12;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);

ds_grid_set_region(map,2,2,10,8,tiletypes.ice);

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set_region(map,1,2,3,4,tiletypes.wall);
ds_grid_set_region(map,1,6,3,10,tiletypes.wall);
ds_grid_set(map,6,2,tiletypes.wall);
ds_grid_set(map,7,3,tiletypes.wall);
ds_grid_set(map,8,4,tiletypes.wall);
ds_grid_set(map,9,5,tiletypes.wall);
ds_grid_set(map,4,8,tiletypes.wall);
ds_grid_set(map,8,8,tiletypes.wall);

ds_grid_set(map,4,2,tiletypes.icygate_green_open);
ds_grid_set(map,5,3,tiletypes.icygate_blue);
ds_grid_set(map,6,6,tiletypes.icygate_red);
ds_grid_set(map,7,7,tiletypes.icygate_green_open);

ds_grid_set(map,4,10,tiletypes.lever_green);
ds_grid_set(map,5,10,tiletypes.lever_red);
ds_grid_set(map,6,10,tiletypes.lever_blue);
ds_grid_set_region(map,7,10,10,10,tiletypes.wall);

ds_grid_set(map,1,5,tiletypes.finish);



//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	var ret = ds_list_create();
	if(!(GetTileStatus(4,2) == tilestatus.blocked)){
		//Green is open(this is bad)
		ds_list_set(ret,0,4);
		ds_list_set(ret,1,10);	
	}else if(!(GetTileStatus(6,6) == tilestatus.blocked)){
		//Red is open(this is bad)
		ds_list_set(ret,0,5);
		ds_list_set(ret,1,10);	
	}else if(GetTileStatus(5,3) == tilestatus.blocked){
		//Blue is shut (this is bad)
		ds_list_set(ret,0,6);
		ds_list_set(ret,1,10);	
	}else{
		//We're good :D
		ds_list_set(ret,0,1);
		ds_list_set(ret,1,5);	
	}
	return ret;
}
