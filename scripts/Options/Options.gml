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

function toggleSound(sound){
	with(obj_toggle_sound){
		if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && (image_index == 0) {
			audio_pause_sound(sound);
			image_index = 1;
			global.sound_on = false;
		}
		else if position_meeting(mouse_x,mouse_y,obj_toggle_sound) && (image_index == 1){
			audio_play_sound(sound,1,true);
			image_index = 0;
			global.sound_on = true;
		}
	}
}
	
function toggleMaze(){
	with(obj_maze_toggle){
		if(keyboard_check_pressed(global.array_of_controls[4]) || (position_meeting(mouse_x,mouse_y,obj_maze_toggle) && mouse_check_button_pressed(mb_left))){
			global.isMazeToggled = !global.isMazeToggled;
			if(global.isMazeToggled){
				image_index = 1;
				if(global.isLevelLoaded){
					solveMaze();
				}	
			}else{
				image_index = 0;
				removeArrows();
			}
		}
	}
}

function toggleHint(){
	with(obj_hint_toggle){
		if(keyboard_check_pressed(global.array_of_controls[5]) || (position_meeting(mouse_x,mouse_y,obj_hint_toggle) && mouse_check_button_pressed(mb_left))){
			global.isHintToggled = !global.isHintToggled;
			if(global.isHintToggled){
				image_index = 1;
				if(global.isLevelLoaded){
					giveMazeHint();
				}
			}else{
				image_index = 0;
				removeCircles();
			}
		}
	}
}

function chesneyMode(){
	with(obj_chesney){
		if(position_meeting(mouse_x,mouse_y, obj_chesney) && mouse_check_button_pressed(mb_left)) && (image_index == 0){
			global.prev_lock = global.lock;
			global.lock = 100;
			global.chesney = true;
			image_index = 1;
		}
		else if (position_meeting(mouse_x,mouse_y, obj_chesney) && mouse_check_button_pressed(mb_left)) && (image_index == 1) {
			global.lock = global.prev_lock;
			global.chesney = false;
			image_index = 0;
		}
	}
}

function toggleColorBlind(){
	with(obj_colorblind){
		if(position_meeting(mouse_x,mouse_y, obj_colorblind) && mouse_check_button_pressed(mb_left)) && (image_index == 0){
			colorBlindMode();
			global.color = true;
			image_index = 1;
		}
		else if (position_meeting(mouse_x,mouse_y, obj_colorblind) && mouse_check_button_pressed(mb_left)) && (image_index == 1) {
			colorBlindMode();
			global.color = false;
			image_index = 0;
		}
	}
}
