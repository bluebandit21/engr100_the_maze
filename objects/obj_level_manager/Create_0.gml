/// @description Insert description here
// You can write your code in this editor


tiles=0;
player=0;
curr_level=0;
global.paused = false;

global.isLevelLoaded = false; //Set to true *only* when rooms are finished loading.

var width_mult = 9.0 / 16.0 * 0.95; //Multiplier for what fraction of screen should be for the maze
global.mazeWidth = window_get_width() * width_mult;

var height_mult = 9.0 / 9.0 * 0.95; //Multiplier for what fraction of screen should be for the maze
global.mazeHeight = window_get_height() *  height_mult;

var widthOffsetPercent = 0.025 * 9 / 16; //Percentage offset of width offset. 0.10 = 10%
global.mazeWidthOffset = window_get_width() * widthOffsetPercent; 

var heightOffsetPercent = 0.025; //Percentage offset of width offset. 0.10 = 10%
global.mazeHeightOffset = window_get_height() * heightOffsetPercent;