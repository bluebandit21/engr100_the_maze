/// @description Insert description here
// You can write your code in this editor
if (room_get_name(room) == "rm_level" && !global.paused) {
	//room_goto(rm_pausescreen);
	room_goto(rm_pause);
} else if (global.paused) {
	room_goto(rm_level);
	global.paused = false;
}
