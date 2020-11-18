if(position_meeting(mouse_x,mouse_y, obj_colorblind) && (!global.color_is_enabled)){
	object_set_sprite(obj_colorblind,spr_color_enabled);
	instance_destroy();
	instance_create_layer(128, 256,"Instances", obj_colorblind);
	colorBlindlevers();
	colorBlindgates();
	global.color_is_enabled = true;
}
else if(position_meeting(mouse_x,mouse_y, obj_colorblind) && (global.color_is_enabled)){
	
	object_set_sprite(obj_colorblind,spr_color_disabled);
	instance_destroy();
	instance_create_layer(128, 256,"Instances", obj_colorblind);
	colorBlindlevers();
	colorBlindgates();
	global.color_is_enabled = false;
}