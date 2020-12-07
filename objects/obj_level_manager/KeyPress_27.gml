/// @description Insert description here
// You can write your code in this editor
if (room_get_name(room) == "rm_level" && !global.paused) {
	instance_create_layer(0, 0, layer_get_id("Layer_pause"), obj_pausescreen);
} else if (global.paused) {
	instance_destroy(obj_pausescreen, true);
}
