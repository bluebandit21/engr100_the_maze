if(position_meeting(mouse_x,mouse_y,obj_speed_high) && global.adjust_speed != 9){
	global.adjust_speed = 9;
	instance_destroy();
	instance_create_layer(400,320,"Instances",obj_speed_high);
}