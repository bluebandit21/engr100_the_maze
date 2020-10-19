// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_input(keyDirection, controlNumber){
	var i_d = ds_map_find_value(async_load,"id");
		if(i_d == keyDirection){
		 if ds_map_find_value(async_load, "status") >= 0
	      {
	      if ds_map_find_value(async_load, "result") != ""
	         {
					localDirection = ds_map_find_value(async_load, "result");
					if(check_controls(string(localDirection), global.array_of_controls))
						global.array_of_controls[controlNumber] = localDirection;
					else
						show_error("Key already assigned", false);
			}
	         }
	      }
}
function determine_switch(determiner){
	switch (determiner){
		case 1:
			find_input(obj_rebindable_up.upKey, 1);
			break;
		case 2:
			find_input(global.downKey,2);
			break;
		case 3:
			find_input(global.leftKey, 3);
			break;
		case 4:
			find_input(global.rightKey, 4);
			break;
		default:
			break;		
	}
}