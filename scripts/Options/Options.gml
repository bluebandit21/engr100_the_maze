// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.colors = ["blue", "red", "green"];

function colorBlindlevers(){
	for(var i = 0; i<3; i++){
		var object = asset_get_index("obj_tile_lever_" + global.colors[i]);
		if(!global.color_is_enabled)
			var sprite = asset_get_index("spr_lever_color_" + global.colors[i]);
		else
			sprite = asset_get_index("spr_lever_" + global.colors[i]);
		object_set_sprite(object,sprite);
	}
}
function colorBlindgates(){
	for(var i = 0; i<3; i++){
		var object = asset_get_index("obj_tile_gate_" + global.colors[i]);
		if(!global.color_is_enabled)
			var sprite = asset_get_index("spr_gate_color_" + global.colors[i]);
		else
			sprite = asset_get_index("spr_gate_" + global.colors[i]);
		object_set_sprite(object,sprite);
	}
}