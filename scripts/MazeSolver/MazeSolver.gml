// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function solveMaze(destx,desty){
	//Grid stores "status" of tiles 
	// 0 -- unvisited
	// 1 -- next-to-visit (in queue)
	// 2 -- already visited, or blocked. Done.
	//Nodes is an array of obj_node objects.
	// Each simply stores the parent x,y coords (or -1,-1 if root)
	// Note that not every element of nodes is guaranteed to be initialized (and in fact many will never be)
	//This is basically an unoptimized flood-fill algorithm, with some magic for teleporters
	// It finds the coord pairs from playerx,playery to provided destx,desty
	
	// First, clear the previous arrows drawn (if they exist)
	
	show_debug_message("Begun maze solver...");
	show_debug_message("Removing previous arrows...");
	while(instance_number(obj_maze_solver_arrow) > 0){
		instance_destroy(instance_find(obj_maze_solver_arrow,0));
	}
	
	var playerx = level_manager.player.playerx;
	var playery = level_manager.player.playery;
	if(playerx == destx && playery == desty){
		show_debug_message("Maze solver called with player starting at dest");
		return;
	}
	
	
	
	var tiles = level_manager.tiles;
	var width = ds_grid_width(tiles);
	var height = ds_grid_height(tiles)
	var grid = ds_grid_create(width,height);
	ds_grid_set_region(grid,0,0,width-1,height-1,0); //Default everything to unvisited
	var nodes = ds_grid_create(width,height);
	
	
	
	for(var col = 0;col<width;col++){
		for(var row = 0;row<height;row++){
			var status = GetTileStatus(col,row);
			if(status == tilestatus.blocked){
				if(destx == col && desty = row){
					show_error("Destination is blocked!", true);
				}
				ds_grid_set(grid,col,row,2); //We'll never be able to reach that tile
			}
		}
	}
	
	
	//TODO! Handle edge case where player is starting on a mover tile!
	
	ds_grid_set(grid,playerx,playery,1); //We always start exploring from where the player is.
	var node = instance_create_layer(0,0,0,obj_node);
	node.parent_x = -1;
	node.parent_y = -1;
	ds_grid_set(nodes,playerx,playery,node);
	
	
	//EDGE CASE MAGIC!
	//If we start standing on a teleporter, we want to unset the teleporter.
	// after exploring all connected locations. Otherwise, we've already visited the teleporter,
	// so we never step through it.
	
	switch(ds_grid_get(level_manager.curr_level.map,playerx,playery)){
		case tiletypes.tele_blue:
		case tiletypes.tele_green:
		case tiletypes.tele_red:
			show_debug_message("Maze solving started on tele; start will be unset.");
			var needToUnsetStart = true;
			break;
		default:
			var needToUnsetStart = false;
	}
	


	
	show_debug_message("Beginning maze flood fill.");
	while(true){
		//-------------------------Locate next tile to explore--------------------------------------
		
		var curr_x = -1; //Current tile check x-index
		var curr_y = -1; // ^, y-index
		
		for(var col = 0;col<width;col++){
			for(var row = 0;row<height;row++){
				if(ds_grid_get(grid,col,row) == 1){ // Found to-explore
					curr_x = col;
					curr_y = row;
					break;
				}
			}
			if(curr_x != -1){ //We already found something; escape the loop
				break;
			}
		}
		
		show_debug_message("Exploring node "+string(curr_x) + ":" + string(curr_y));
		
		if(curr_x == -1 or curr_y == -1){
			show_error("Unable to locate path to coord -- fatal",true);
		}
		
		//-------------------------Explore the tile--------------------------------------
		
		ds_grid_set(grid,curr_x,curr_y,2); //We've explored this tile now.


		for(var index = 0;index<4;index+=1){
			//Each of 4 cardinal directions.
			if(index == 0){
				//Left
				var neighb_x = curr_x - 1;
				var neighb_y = curr_y;
				if(!(curr_x>=1)){
					continue; //This would put us out of bounds.
				}
			}
			if(index == 1){
				//Right
				var neighb_x = curr_x + 1;
				var neighb_y = curr_y;
				if(!(curr_x <= width - 2)){
					continue; //This would put us out of bounds.
				}
			}
			if(index == 2){
				//Down
				var neighb_x = curr_x;
				var neighb_y = curr_y - 1;
				if(!(curr_y>=1)){
					continue; //This would put us out of bounds.
				}
			}
			if(index == 3){
				//Up
				var neighb_x = curr_x;
				var neighb_y = curr_y+1;
				if(!(curr_y <= height - 2)){
					continue; // This would put us out of bounds
				}
			}
		
		
			if(ds_grid_get(grid,neighb_x,neighb_y) == 0){
				//We can reach the tile, but haven't yet (although it might still do magic)
				var node = instance_create_layer(0,0,0,obj_node);
				node.parent_x = curr_x; 
				node.parent_y = curr_y;
				ds_grid_set(nodes,neighb_x,neighb_y,node); //We reached the neighbor from here
					
				var status = GetTileStatus(neighb_x,neighb_y);
				
				if(status == tilestatus.passable){
					//We need to explore the tile, but it's a regular tile.
					ds_grid_set(grid,neighb_x,neighb_y,1); //Mark it as to-explore
				}else if(status == tilestatus.interaction || status == tilestatus.blocked){
					ds_grid_set(grid,neighb_x,neighb_y,2); //We can't actually move onto this tile
				}else{ 
					show_debug_message("Found mover tile at "+string(neighb_x) + ":"+string(neighb_y));
					//This is a magic mover tile. 
					// Mark it as already explored, and its destination as to-explore.
					ds_grid_set(grid,neighb_x,neighb_y,2); //We can't actually stand on this tile
					
					var link = MoveWithTile(curr_x,curr_y,neighb_x,neighb_y); // Dest is where it takes us.
					var linkx = ds_list_find_value(link,0);
					var linky = ds_list_find_value(link,1);
					show_debug_message("Move linked to "+string(linkx) + ":" + string(linky));
					
					
					
					if((ds_grid_get(grid,linkx,linky) == 0) ||
					(linkx == neighb_x && linky == neighb_y)){
						//If it's unvisited *or* we end up moving to the same mover tile.
						//Mark the destination as something to explore.
						var node = instance_create_layer(0,0,0,obj_node);
						if((linkx == neighb_x) && (linky == neighb_y)){
							node.parent_x = curr_x; //Mover can't link to itself
							node.parent_y = curr_y;
						}else{
							node.parent_x = neighb_x; 
							node.parent_y = neighb_y;
						}
						ds_grid_set(nodes,linkx,linky,node); //We reached the neighbor from here
						ds_grid_set(grid,linkx,linky,1); //We want to explore it
					}
				}
			}	
		}
		if(ds_grid_get(grid,destx,desty)!=0){
			break; //We've found some path; unwind.
		}
		if(needToUnsetStart){
			//Handle edge case (explained in above comment)
			show_debug_message("Handling teleport edge case (unsetting start)");
			needToUnsetStart = false;
			ds_grid_set(grid,playerx,playery,0); //"Unvisit" first node
		}
	}
	
	// We now have a series of nodes.
	// Every node in the path to destx,desty has a parent x,y , which can reach it.
	// We just have to *start* at destx,desty and loop backwards
	
	// We now want to draw the arrows to show the player the solution
	
	
	var curr_x = destx;
	var curr_y = desty;
	
	//Draw circle at destx,desty
	show_debug_message("Beginning back-solve of maze.");
	while(!((curr_x == playerx) and (curr_y == playery))){
		//------------Find parent coords
		var node = ds_grid_get(nodes, curr_x,curr_y);
		var parentx = node.parent_x;
		var parenty = node.parent_y;
		show_debug_message("Current node: "+string(curr_x) + ":" + string(curr_y));
		
		//--------------Draw arrow from parentx,parenty to curr_x,curr_y 
		
		//Find current tilex, tiley (scaled to room)
		var tilex = parentx*room_width / width;
		var tiley = parenty*room_height / height;
			
		//Create instance and scale appropriately
		var instance = instance_create_depth(tilex,tiley,-10,obj_maze_solver_arrow); //TODO -- set depth correctly!
		var scalex = room_width / width / instance.sprite_width;
		instance.image_xscale=scalex;
		var scaley = room_height / height / instance.sprite_height;
		instance.image_yscale=scaley;
		
		instance.x+= instance.sprite_width / 2;
		instance.y+= instance.sprite_height / 2;
		//Rotate so imagine points in correct direction.
		// tan(theta) equals delta x / delta y, since arrow points straight up by default.
		// ergo, theta equal atan((parentx - currx) / (parenty - curry))
		var angle = arctan((parentx - curr_x + 0.0) / (parenty - curr_y + 0.0));
		if(parenty < curr_y){
			angle = angle+pi; //Rotate by 180
		}
		
		angle *= 360 / 2 / pi; ///Convert rads to degrees
		instance.image_angle = angle;
		
		//Rotate arrow here?
		curr_x = parentx;
		curr_y = parenty;
	}
	show_debug_message("End back-solve of maze.");
	
	
}