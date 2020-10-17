if(booleanDown){
	var i_d = ds_map_find_value(async_load,"id");
		if(i_d == downKey){
		 if ds_map_find_value(async_load, "status")
	      {
	      if ds_map_find_value(async_load, "result") != ""
	         {
					localDown = ds_map_find_value(async_load, "result");
					if(check_controls(string(localDown), global.array_of_controls))
						global.array_of_controls[2] = localDown;
					else
						show_error("Key already assigned", true);
			}
	         }
	      }
}