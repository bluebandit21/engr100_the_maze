// You can write your code in this editor
var width = 16; // TODO -- Make this not hardcoded?
var height = 16;// TODO -- Make this not hardcoded?
map = ds_grid_create(width,height);
ds_grid_set_region(map,0,0,width-1,height-1,tiletypes.empty);
ds_grid_set_region(map,0,0,width-1,0,tiletypes.wall);
ds_grid_set_region(map,0,height-1,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,0,0,0,height-1,tiletypes.wall);
ds_grid_set_region(map,width-1,0,width-1,height-1,tiletypes.wall);
ds_grid_set_region(map,1,2,5,2,tiletypes.wall);
ds_grid_set_region(map,2,4,2,4,tiletypes.wall);
ds_grid_set_region(map,5,3,5,3,tiletypes.wall);
ds_grid_set_region(map,4,4,5,4,tiletypes.wall);
ds_grid_set_region(map,1,6,2,6,tiletypes.wall);
ds_grid_set_region(map,2,7,2,12,tiletypes.wall);
ds_grid_set_region(map,3,12,5,12,tiletypes.wall);
ds_grid_set_region(map,7,1,7,6,tiletypes.wall);
ds_grid_set_region(map,4,6,6,6,tiletypes.wall);
ds_grid_set_region(map,4,7,4,10,tiletypes.wall);
ds_grid_set_region(map,5,10,5,10,tiletypes.wall);
ds_grid_set_region(map,1,14,9,14,tiletypes.wall);
ds_grid_set_region(map,7,12,9,12,tiletypes.wall);
ds_grid_set_region(map,6,8,7,8,tiletypes.wall);
ds_grid_set_region(map,7,9,7,10,tiletypes.wall);
ds_grid_set_region(map,8,10,9,10,tiletypes.wall);
ds_grid_set_region(map,9,2,9,9,tiletypes.wall);
ds_grid_set_region(map,10,2,13,2,tiletypes.wall);
ds_grid_set_region(map,10,4,14,4,tiletypes.wall);
ds_grid_set_region(map,11,6,11,14,tiletypes.wall);
ds_grid_set_region(map,13,5,13,14,tiletypes.wall);

ds_grid_set_region(map,1,7,1,7,tiletypes.lever_green);
ds_grid_set_region(map,12,6,12,6,tiletypes.gate_green);
ds_grid_set_region(map,12,14,12,14,tiletypes.lever_red);
ds_grid_set_region(map,14,2,14,2,tiletypes.gate_red);
ds_grid_set_region(map,8,8,8,8,tiletypes.gate_red_open);
ds_grid_set_region(map,10,3,10,3,tiletypes.lever_blue);
ds_grid_set_region(map,14,9,14,9,tiletypes.gate_blue);
ds_grid_set_region(map,8,9,8,9,tiletypes.lever_purple);
ds_grid_set_region(map,1,13,1,13,tiletypes.gate_purple);
ds_grid_set_region(map,14,8,14,8,tiletypes.gate_purple_open);

ds_grid_set_region(map,1,5,5,5,tiletypes.ice);
ds_grid_set_region(map,5,11,7,11,tiletypes.ice);

ds_grid_set(map,4,3,tiletypes.tele_blue);
ds_grid_set(map,14,5,tiletypes.tele_blue);
tele_x = [14,4];
tele_y = [5,3];

ds_grid_set(map,1,1,tiletypes.start);
ds_grid_set(map,width-2,height-2,tiletypes.finish);

//Function declared per-level. 
//Solves next item to interact with based on global state. (Yikes)
function SolveNextItem(){
	var ret = ds_list_create();
	if((GetTileStatus(14,8) == tilestatus.passable)
		&& (GetTileStatus(14,9) == tilestatus.passable)){
		//Both purple & blue are open.
		//Go for the goal!
		ds_list_set(ret,0,14);
		ds_list_set(ret,1,14);	
	}else if(GetTileStatus(14,9) == tilestatus.passable){
		//Blue is open. We need to go for purple
		if(GetTileStatus(8,8) == tilestatus.passable){
			//Red restricting access to purple is open. Go for purple lever
			ds_list_set(ret,0,8);
			ds_list_set(ret,1,9);	
		}else{
			//Red is closed for some reason. Hit its lever
			if(GetTileStatus(12,6) == tilestatus.passable){
				//Green gate restricting is open. Red is a-o-k
				ds_list_set(ret,0,12);
				ds_list_set(ret,1,14);	
			}else{
				//Guess we have to hit green.
				// We can always reach is because purple is open on the left, shut on right	
				ds_list_set(ret,0,1);
				ds_list_set(ret,1,7);	
			}
		}
	}else{
		//Blue is closed. Go for it.
		if(GetTileStatus(14,2) == tilestatus.passable){
			//Can reach blue lever.
			ds_list_set(ret,0,10);
			ds_list_set(ret,1,3);	
		}else{
			//Go for red lever
			if(GetTileStatus(12,6) == tilestatus.passable){
				//Green gate restricting is open. Red is a-o-k
				ds_list_set(ret,0,12);
				ds_list_set(ret,1,14);	
			}else{
				//We need to open the green gate
				if(GetTileStatus(1,13) == tilestatus.passable){
					//We can reach the green lever
					ds_list_set(ret,0,1);
					ds_list_set(ret,1,7);	
				}else{
					//Gusss we're hitting purple. (We can always reach it.)
					ds_list_set(ret,0,8);
					ds_list_set(ret,1,9);	
				}
			}
		}
		
	}
	
	return ret;
}


