if position_meeting(mouse_x,mouse_y,obj_maze_toggle) && !global.maze_toggled{
	var inst = instance_position(mouse_x, mouse_y, obj_maze_toggle);
	object_set_sprite(obj_maze_toggle,spr_maze_toggle_on);
	instance_destroy();
	instance_create_depth(inst.x,inst.y,-16000,obj_maze_toggle);
	global.maze_toggled = true;
	solveMaze();
	show_debug_message("Attempting to run maze solver...");
}
else if position_meeting(mouse_x,mouse_y,obj_maze_toggle) && global.maze_toggled{
	var inst = instance_position(mouse_x, mouse_y, obj_maze_toggle);
	object_set_sprite(obj_maze_toggle,spr_maze_toggle_off);
	instance_destroy();
	instance_create_depth(inst.x,inst.y,-16000,obj_maze_toggle);
	global.maze_toggled = false;
	removeArrows();
}