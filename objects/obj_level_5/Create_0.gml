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
ds_grid_set_region(map,2,1,2,5,tiletypes.wall);
ds_grid_set_region(map,3,5,6,5,tiletypes.wall);
ds_grid_set_region(map,6,2,6,4,tiletypes.wall);
ds_grid_set_region(map,4,2,5,2,tiletypes.wall);
ds_grid_set_region(map,4,3,4,3,tiletypes.wall);
ds_grid_set_region(map,1,7,6,7,tiletypes.wall);
ds_grid_set_region(map,2,8,2,9,tiletypes.wall);
ds_grid_set_region(map,3,9,4,9,tiletypes.wall);
ds_grid_set_region(map,6,8,6,13,tiletypes.wall);
ds_grid_set_region(map,2,13,5,13,tiletypes.wall);
ds_grid_set_region(map,2,11,2,12,tiletypes.wall);
ds_grid_set_region(map,3,11,4,11,tiletypes.wall);
ds_grid_set_region(map,8,1,8,8,tiletypes.wall);
ds_grid_set_region(map,8,10,8,12,tiletypes.wall);
ds_grid_set_region(map,8,14,8,14,tiletypes.wall);
ds_grid_set_region(map,9,2,13,2,tiletypes.wall);
ds_grid_set_region(map,10,4,10,6,tiletypes.wall);
ds_grid_set_region(map,9,8,11,8,tiletypes.wall);
ds_grid_set_region(map,9,10,11,10,tiletypes.wall);
ds_grid_set_region(map,9,12,9,12,tiletypes.wall);
ds_grid_set_region(map,10,14,10,14,tiletypes.wall);
ds_grid_set_region(map,11,12,12,12,tiletypes.wall);
ds_grid_set_region(map,11,4,12,4,tiletypes.wall);
ds_grid_set_region(map,11,6,11,6,tiletypes.wall);
ds_grid_set_region(map,13,4,13,14,tiletypes.wall);
ds_grid_set_region(map,5,3,5,3,tiletypes.lever_red);
ds_grid_set_region(map,8,9,8,9,tiletypes.gate_red);
ds_grid_set_region(map,14,4,14,4,tiletypes.gate_red_open);
ds_grid_set_region(map,9,1,9,1,tiletypes.lever_green);
ds_grid_set_region(map,8,13,8,13,tiletypes.gate_green);
ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,height-2,width-2,tiletypes.finish);


//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	var ret = ds_list_create();
	if(GetTileStatus(8,13) == tilestatus.blocked){
		//Green is shut.
		
		//Player's outside the end zone.
		 if(GetTileStatus(8,9) == tilestatus.blocked){ 
			//Both are shut.
			if(level_manager.player.playerx>7){
				//If the player just shut it behind them
				//Go for the goal!
				ds_list_set(ret,0,14);
				ds_list_set(ret,1,14);
			}
			//open Red
			else{
				ds_list_set(ret,0,5);
				ds_list_set(ret,1,3);
			}
		}else{
			//We can reach the green lever; hit it
			ds_list_set(ret,0,9);
			ds_list_set(ret,1,1);	
		}	
	}else{
		//Green is open
		if(GetTileStatus(14,4) == tilestatus.blocked){
			//"Open"-red is shut.
			ds_list_set(ret,0,5);
			ds_list_set(ret,1,3);
		}else{
			//Go for the goal!
			ds_list_set(ret,0,14);
			ds_list_set(ret,1,14);
		}
	}
	return ret;
}
