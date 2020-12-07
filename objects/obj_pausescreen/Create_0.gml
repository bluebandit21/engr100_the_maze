/// @description Insert description here
// You can write your code in this editor
global.paused = true;
var back_obj = instance_create_depth(40, 40, -16000, obj_optiontohome);
back_obj.image_xscale = 0.15;
back_obj.image_yscale = 0.15;
var sound_toggle_obj = instance_create_depth(40, 200, -16000, obj_toggle_sound);
var sound_toggle_obj = instance_create_depth(40, 400, -16000, obj_maze_toggle);
var hint_toggle_obj = instance_create_depth(40, 300, -16000, obj_hint_toggle);
instance_create_depth(40, 500, -16000, obj_optionbutton);