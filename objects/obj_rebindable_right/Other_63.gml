if(booleanRight){	
	var i_d = ds_map_find_value(async_load,"id");
		if(i_d == rightKey){
		 if ds_map_find_value(async_load, "status")
	      {
	      if ds_map_find_value(async_load, "result") != ""
	         {
					localRight = ds_map_find_value(async_load, "result");
					if(check_controls(string(localRight), global.array_of_controls))
						global.array_of_controls[4] = localRight;
					else
						show_error("Key already assigned", false);
			}
	         }
	      }
}