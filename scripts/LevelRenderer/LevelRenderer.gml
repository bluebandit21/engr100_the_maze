// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadLevel(level){
	var level_width = ds_grid_width(level.map);
	var level_height = ds_grid_height(level.map);
	tiles = ds_grid_create(level_width,level_height);
	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			
			var tiletype = ds_grid_get(level.map,col, row);
			var tileobj = GetTileObjectFromTileType(tiletype);
			
			var tilex = col*room_width / level_width;
			var tiley = row*room_height / level_height;
			
			var instance = instance_create_depth(tilex,tiley,0,tileobj); //TODO -- set depth correctly!
			ds_grid_set(tiles,col,row,instance);
		}
	}
}