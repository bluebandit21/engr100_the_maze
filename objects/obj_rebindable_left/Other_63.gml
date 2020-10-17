if(booleanLeft){
	var i_d = ds_map_find_value(async_load,"id");
		if(i_d == leftKey){
		 if ds_map_find_value(async_load, "status")
	      {
	      if ds_map_find_value(async_load, "result") != ""
	         {
					localLeft = ds_map_find_value(async_load, "result");
					if(check_controls(string(localLeft), global.array_of_controls))
						global.array_of_controls[3] = localLeft;
					else
						show_error("Key already assigned", true);
			}
	         }
	      }
}