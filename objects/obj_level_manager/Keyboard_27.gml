/// @description Insert description here
// You can write your code in this editor
if (room_get_name(room) == "rm_level") {
	room_goto(rm_pausescreen);
} else if (room_get_name(room) == "rm_pausescreen") {
	room_goto(rm_level);
}
