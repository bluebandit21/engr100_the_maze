if(position_meeting(mouse_x,mouse_y, obj_chesney) && (!global.is_enabled)){
	global.lock = 100;
	object_set_sprite(obj_chesney,spr_enabled);
	instance_destroy();
	instance_create_layer(128, 192,"Instances", obj_chesney);
	global.is_enabled = true;
}
else if(position_meeting(mouse_x,mouse_y, obj_chesney) && (global.is_enabled)){
	global.lock = 2;
	object_set_sprite(obj_chesney,spr_disabled);
	instance_destroy();
	instance_create_layer(128, 192,"Instances", obj_chesney);
	global.is_enabled = false;
}