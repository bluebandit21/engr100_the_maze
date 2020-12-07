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
ds_grid_set_region(map,2,1,2,4,tiletypes.wall);
ds_grid_set_region(map,3,4,5,4,tiletypes.wall);
ds_grid_set_region(map,2,6,5,6,tiletypes.wall);
ds_grid_set_region(map,5,7,5,11,tiletypes.wall);
ds_grid_set_region(map,2,1,2,4,tiletypes.wall);
ds_grid_set_region(map,2,11,4,11,tiletypes.wall);
ds_grid_set_region(map,2,9,2,10,tiletypes.wall);
ds_grid_set_region(map,2,8,3,8,tiletypes.wall);
ds_grid_set_region(map,3,10,4,10,tiletypes.wall);
ds_grid_set_region(map,1,13,7,13,tiletypes.wall);
ds_grid_set_region(map,7,2,7,12,tiletypes.wall);
ds_grid_set_region(map,4,2,6,2,tiletypes.wall);
ds_grid_set_region(map,9,2,9,11,tiletypes.wall);
ds_grid_set_region(map,9,13,9,14,tiletypes.wall);
ds_grid_set_region(map,10,7,14,7,tiletypes.wall);
ds_grid_set_region(map,11,1,11,6,tiletypes.wall);
ds_grid_set_region(map,13,2,14,2,tiletypes.wall);
ds_grid_set_region(map,13,3,13,5,tiletypes.wall);
ds_grid_set_region(map,11,13,11,13,tiletypes.wall);
ds_grid_set_region(map,11,9,11,10,tiletypes.wall);
ds_grid_set_region(map,11,11,12,11,tiletypes.wall);
ds_grid_set_region(map,13,8,13,14,tiletypes.wall);


ds_grid_set_region(map,1,6,1,11,tiletypes.ice);
ds_grid_set_region(map,9,12,11,12,tiletypes.ice);

ds_grid_set_region(map,10,6,10,6,tiletypes.lever_red);
ds_grid_set_region(map,5,12,5,12,tiletypes.gate_red_open);
ds_grid_set_region(map,13,6,13,6,tiletypes.gate_red);
ds_grid_set_region(map,1,14,1,14,tiletypes.lever_green);
ds_grid_set_region(map,9,1,9,1,tiletypes.gate_green);
ds_grid_set_region(map,14,11,14,11,tiletypes.gate_green_open);
ds_grid_set_region(map,14,3,14,3,tiletypes.lever_blue);
ds_grid_set_region(map,1,6,1,6,tiletypes.icygate_blue_open);


ds_grid_set(map,14,1,tiletypes.tele_blue);
ds_grid_set(map,14,8,tiletypes.tele_blue);
ds_grid_set(map,3,9,tiletypes.tele_blue);
ds_grid_set(map,12,10,tiletypes.tele_blue);
tele_x = [12,3,14,14];
tele_y = [10,9,8,1];


ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);

//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	var ret = ds_list_create();
	if(GetTileStatus(1,6) == tilestatus.blocked){
		//Blue's path is accessible
		if(GetTileStatus(5,12) == tilestatus.passable){
			//So is red's
			if(GetTileStatus(14,11) == tilestatus.passable){
				//So is green. Goal time
				ds_list_set(ret,0,14);
				ds_list_set(ret,1,14);	
			}else{
				//Time to hit green. GLever
				ds_list_set(ret,0,1);
				ds_list_set(ret,1,14);	
			}
		}else{
			//Red isn't.
			if(GetTileStatus(9,1) == tilestatus.passable){
				//Red lever time
				ds_list_set(ret,0,10);
				ds_list_set(ret,1,6);
			}else{
				//Green lever time.
				ds_list_set(ret,0,1);
				ds_list_set(ret,1,14);
			}
		}
	}else{
		//Blue is open
		if(GetTileStatus(13,6) == tilestatus.passable){
			//Red is open. Blever time
			ds_list_set(ret,0,14);
			ds_list_set(ret,1,3);
		}else{
			if(GetTileStatus(9,1) == tilestatus.passable){
				//Red lever time
				ds_list_set(ret,0,10);
				ds_list_set(ret,1,6);
			}else{
				//Green lever time.
				ds_list_set(ret,0,1);
				ds_list_set(ret,1,14);
			}
		}
	}
	
	return ret;
}
