
//Do extra initialization on certain tiles (arg1,arg2 are optional, and only used for some)
function InitiateTileInstance(instance,type,arg1,arg2){
	switch(type){
		case tiletypes.gate_blue_open:
		case tiletypes.gate_red_open:
		case tiletypes.gate_green_open:
		case tiletypes.gate_purple_open:
		case tiletypes.icygate_blue_open:
		case tiletypes.icygate_red_open:
		case tiletypes.icygate_green_open:
		case tiletypes.icygate_purple_open:
			instance.open = true;
			break;
		case tiletypes.tele_blue:
		case tiletypes.tele_green:
		case tiletypes.tele_red:
			instance.link_x = arg1;
			instance.link_y = arg2;
			break;
		default:
			return;
	}
}


//Initialize level, creating sprites as neccesary and creating instances
function LoadLevel(level){
	level_manager.curr_level = level;
	var level_width = ds_grid_width(level.map);
	var level_height = ds_grid_height(level.map);

	level_manager.tiles = ds_grid_create(level_width,level_height);
	
	var tele_coord_idx = 0; // Which set of coords to grab
	var transparency = instance_create_depth(global.mazeWidthOffset,global.mazeHeightOffset,1,obj_partial_transparency);
	transparency.image_xscale = global.mazeWidth / transparency.sprite_width;
	transparency.image_yscale = global.mazeHeight / transparency.sprite_height;
	for(var row = 0; row<level_height;row++){
		for(var col=0; col<level_width;col++){
			
			var tiletype = ds_grid_get(level.map,col, row);
	
			
			var tileobj = GetTileObjectFromTileType(tiletype);
			
			var tilex = col / level_width * global.mazeWidth + global.mazeWidthOffset;
			var tiley = row / level_height * global.mazeHeight + global.mazeHeightOffset;
			
			var instance = instance_create_depth(tilex,tiley,0,tileobj); //TODO -- set depth correctly!
			
			if(tiletype == tiletypes.start){
				player = instance_create_depth(tilex,tiley,-1,obj_player); //Initialize player on starting square
				//Player starts at depth -1 so they're always rendered on top.
				player.playerx = col;
				player.playery= row;
				var scalex = global.mazeWidth / level_width / player.sprite_width;
				player.image_xscale = scalex;
				var scaley = global.mazeHeight / level_height / player.sprite_height;
				player.image_yscale=scaley;
				level_manager.player = player;
			}else if((tiletype == tiletypes.tele_blue) 
				or (tiletype == tiletypes.tele_blue) 
				or (tiletype == tiletypes.tele_blue)){
				InitiateTileInstance(instance,tiletype,level.tele_x[tele_coord_idx],level.tele_y[tele_coord_idx]);
				tele_coord_idx+=1;
			}else{
				InitiateTileInstance(instance,tiletype);
			}
			
			
			
			var scalex = global.mazeWidth / level_width / instance.sprite_width;
			instance.image_xscale=scalex;
			var scaley = global.mazeHeight / level_height / instance.sprite_height;
			instance.image_yscale=scaley;
			
			ds_grid_set(level_manager.tiles,col,row,instance.id);
			
		}
	}
}

