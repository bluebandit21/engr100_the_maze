// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.colors = ["blue", "red", "green","purple"];

function colorBlindlevers(){
	for(var i = 0; i<array_length_1d(global.colors); i++){
		var object = asset_get_index("obj_tile_lever_" + global.colors[i]);
		if(!global.color_is_enabled)
			var sprite = asset_get_index("spr_lever_color_" + global.colors[i]);
		else
			sprite = asset_get_index("spr_lever_" + global.colors[i]);
		object_set_sprite(object,sprite);
	}
}
function colorBlindgates(){
	for(var i = 0; i<array_length_1d(global.colors); i++){
		var object = asset_get_index("obj_tile_gate_" + global.colors[i]);
		if(!global.color_is_enabled)
			var sprite = asset_get_index("spr_gate_color_" + global.colors[i]);
		else
			sprite = asset_get_index("spr_gate_" + global.colors[i]);
		object_set_sprite(object,sprite);
	}
}

function colorBlindIcyGates(){
	for(var i = 0; i<array_length_1d(global.colors); i++){
		var object = asset_get_index("obj_tile_icygate_" + global.colors[i]);
		if(!global.color_is_enabled)
			var sprite = asset_get_index("spr_icygate_color_" + global.colors[i]);
		else
			sprite = asset_get_index("spr_icygate_" + global.colors[i]);
		object_set_sprite(object,sprite);
	}
}

function colorBlindMode(){
	colorBlindgates();
	colorBlindlevers();
	colorBlindIcyGates();
}

function toggleSound(sound, is_menu){
	if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && global.sound_on{
		audio_pause_sound(sound);
		object_set_sprite(obj_toggle_sound,spr_sound_toggle_off);
		instance_destroy();
		if is_menu
			instance_create_depth(128,320,-16000,obj_toggle_sound);
		else
			instance_create_depth(40,200,-16000,obj_toggle_sound);
		global.sound_on = false;
	}
	else if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && !global.sound_on{
		audio_play_sound(sound,1,true);
		object_set_sprite(obj_toggle_sound,spr_sound_toggle_on);
		instance_destroy();
		if is_menu
			instance_create_depth(128,320,-16000,obj_toggle_sound);
		else
			instance_create_depth(40,200,-16000,obj_toggle_sound);
		global.sound_on = true;
	}
}
	