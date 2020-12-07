/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_newgame, image_index, x, y);
if (variable_global_exists("played")) {
	if (global.played > 0) {
		image_index = 1;
		draw_sprite(spr_newgame, image_index, x, y);
	} else {
		image_index = 0;
		draw_sprite(spr_newgame, image_index, x, y);
	}
} else {
	image_index = 0;
	draw_sprite(spr_newgame, 0, x, y);
}