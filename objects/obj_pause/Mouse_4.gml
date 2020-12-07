/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, obj_pause) && !global.paused) {
	instance_create_layer(0, 0, layer_get_id("Layer_pause"), obj_pausescreen);
}