if(booleanUp){	
	var i_d = ds_map_find_value(async_load,"id");
		if(i_d == upKey){
		 if ds_map_find_value(async_load, "status")
	      {
	      if ds_map_find_value(async_load, "result") != ""
	         {
					localUp = ds_map_find_value(async_load, "result");
					if(check_controls(string(localUp), global.array_of_controls))
						global.array_of_controls[1] = localUp;
					else
						show_error("Key already assigned", true);
			}
	         }
	      }
}