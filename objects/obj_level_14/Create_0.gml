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
ds_grid_set_region(map,2,5,2,5,tiletypes.wall);
ds_grid_set_region(map,2,8,2,13,tiletypes.wall);
ds_grid_set_region(map,3,8,3,8,tiletypes.wall);
ds_grid_set_region(map,4,6,4,9,tiletypes.wall);
ds_grid_set_region(map,5,6,6,6,tiletypes.wall);
ds_grid_set_region(map,6,2,6,5,tiletypes.wall);
ds_grid_set_region(map,7,2,7,2,tiletypes.wall);
ds_grid_set_region(map,8,2,8,13,tiletypes.wall);
ds_grid_set_region(map,7,8,7,8,tiletypes.wall);
ds_grid_set_region(map,6,8,6,14,tiletypes.wall);
ds_grid_set_region(map,4,11,4,14,tiletypes.wall);
ds_grid_set_region(map,10,1,10,7,tiletypes.wall);
ds_grid_set_region(map,11,7,11,7,tiletypes.wall);
ds_grid_set_region(map,12,2,13,2,tiletypes.wall);
ds_grid_set_region(map,12,4,12,7,tiletypes.wall);
ds_grid_set_region(map,14,4,14,9,tiletypes.wall);
ds_grid_set_region(map,10,9,13,9,tiletypes.wall);
ds_grid_set_region(map,10,11,13,11,tiletypes.wall);
ds_grid_set_region(map,10,12,10,14,tiletypes.wall);
ds_grid_set_region(map,12,13,14,13,tiletypes.wall);

ds_grid_set_region(map,9,7,9,11,tiletypes.ice);

ds_grid_set_region(map,3,3,3,3,tiletypes.lever_red);
ds_grid_set_region(map,2,14,2,14,tiletypes.gate_red);
ds_grid_set_region(map,12,12,12,12,tiletypes.gate_red_open);
ds_grid_set_region(map,7,9,7,9,tiletypes.lever_green);
ds_grid_set_region(map,13,7,13,7,tiletypes.gate_green);
ds_grid_set_region(map,7,3,7,3,tiletypes.lever_blue);
ds_grid_set_region(map,9,9,9,9,tiletypes.icygate_blue);


ds_grid_set(map,11,1,tiletypes.tele_blue);
ds_grid_set(map,11,2,tiletypes.wall);
ds_grid_set(map,11,10,tiletypes.tele_blue);
ds_grid_set(map,10,10,tiletypes.wall);
tele_x = [11,11];
tele_y = [10,1];


ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);


//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	
	//Open green
	//Close blue
	//Open red
	var ret = ds_list_create();
	
	
	if(GetTileStatus(13,7) == tilestatus.passable){
		//Green is open.
		if(GetTileStatus(9,9) == tilestatus.blocked){
			//Blue is shut
			if(GetTileStatus(12,12) == tilestatus.passable){
				//Red is open
				//Go for the flag
				ds_list_set(ret,0,14);
				ds_list_set(ret,1,14);
			}else{
				//Go for red
				ds_list_set(ret,0,3);
				ds_list_set(ret,1,3);
			}
		}else{
			//Blue is open. Close it
			if(GetTileStatus(2,14) == tilestatus.passable){
				//Can reach blue lever. Hit it.
				ds_list_set(ret,0,7);
				ds_list_set(ret,1,3);
			}else{
				//Go for red
				ds_list_set(ret,0,3);
				ds_list_set(ret,1,3);
			}
		}
	}else{
		//Green is shut.
		if(GetTileStatus(9,9) == tilestatus.blocked){
			//Blue is shut. Open it.
			if(GetTileStatus(2,14) == tilestatus.passable){
				//Can reach blue lever. Hit it.
				ds_list_set(ret,0,7);
				ds_list_set(ret,1,3);
			}else{
				//Go for red
				ds_list_set(ret,0,3);
				ds_list_set(ret,1,3);
			}
		}else{
			//Blue is open. Go for the green!
			ds_list_set(ret,0,7);
			ds_list_set(ret,1,9);
		}
	}
	return ret;
}


