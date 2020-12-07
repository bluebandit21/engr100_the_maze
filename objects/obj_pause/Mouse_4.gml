/// @description Insert description here
// You can write your code in this editor
if (!global.paused) {
	instance_create_depth(0, 0, -8000, obj_pausescreen);
} else if (global.paused) {
	instance_destroy(obj_pausescreen, true);
}
