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
	
	var playerx = level_manager.player.playerx;
	var playery = level_manager.player.playery;
	if(playerx == destx && playery == desty){
		//Special case -- our starting point *is* our goal.
		//TODO: Return pair of one? none? Something.
	}
	
	
	
	var tiles = level_manager.tiles;
	var width = ds_grid_width(tiles);
	var height = ds_grid_height(tiles)
	var grid = ds_grid_create(width,height);
	ds_grid_set_region(grid,0,0,width-1,height-1,0); //Default everything to unvisited
	var nodes = ds_grid_create(width,height);
	
	
	
	for(var row = 0;col<width;col++){
		for(var col = 0;row<height;row++){
			var status = GetTileStatus(col,row);
			if(status == tilestatus.blocked){
				ds_grid_set(grid,col,row,2); //We'll never be able to reach that tile
			}
		}
	}
	
	
	ds_grid_set(grid,playerx,playery,1); //We always start exploring from where the player is.
	var node = instance_create_layer(0,0,"mazesolver_nodes",obj_node);
	node.parent_x = -1;
	node.parent_y = -1;
	ds_grid_set(nodes,playerx,playery,node);
	
	while(true){
		//-------------------------Locate next tile to explore--------------------------------------
		
		var curr_x = -1; //Current tile check x-index
		var curr_y = -1; // ^, y-index
		
		for(var row = 0;col<width;col++){
			for(var col = 0;row<height;row++){
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
		
		if(curr_x == -1 or curr_y == -1){
			show_error("Unable to locate path to coord -- fatal",true);
		}
		
		if(curr_x == destx && curr_y = desty){
			break; //We're done, unwind
		}
		
		//-------------------------Explore the tile--------------------------------------
		
		ds_grid_set(grid,curr_x,curr_y,2); //We've explored this tile now.
		
		//TODO: Ice is going to royally heck with this. Fix me in the future.
		// ("Neighboring" tiles aren't actually neighbors with slidy ice)
		
		// Set neigbors to explore and set parentx,y to current (we reached the neighbor from here)
		if(curr_x >= 1){
			var neighb_x = curr_x - 1;
			var neighb_y = curr_y;
			if(ds_grid_get(grid,neighb_x,neighb_y) == 0){
				ds_grid_set(grid,neighb_x,neighb_y,1); //Mark it as to-explore
			}
			var node = instance_create_layer(0,0,"mazesolver_nodes",obj_node);
			node.parent_x = curr_x; //We reched the neighbor from here
			node.parent_y = curr_y;
			ds_grid_set(nodes,neighb_x,neighb_y,node);
		}
		if(curr_x <= width - 2){
			var neighb_x = curr_x + 1;
			var neighb_y = curr_y;
			if(ds_grid_get(grid,neighb_x,neighb_y) == 0){
				ds_grid_set(grid,neighb_x,neighb_y,1); //Mark it as to-explore
			}
			var node = instance_create_layer(0,0,"mazesolver_nodes",obj_node);
			node.parent_x = curr_x; //We reched the neighbor from here
			node.parent_y = curr_y;
			ds_grid_set(nodes,neighb_x,neighb_y,node);
		}
		if(curr_y >= 1){
			var neighb_x = curr_x;
			var neighb_y = curr_y - 1;
			if(ds_grid_get(grid,neighb_x,neighb_y) == 0){
				ds_grid_set(grid,neighb_x,neighb_y,1); //Mark it as to-explore
			}
			var node = instance_create_layer(0,0,"mazesolver_nodes",obj_node);
			node.parent_x = curr_x; //We reched the neighbor from here
			node.parent_y = curr_y;
			ds_grid_set(nodes,neighb_x,neighb_y,node);
		}
		
		if(curr_y <= height - 2){
			var neighb_x = curr_x;
			var neighb_y = curr_y+1;
			if(ds_grid_get(grid,neighb_x,neighb_y) == 0){
				ds_grid_set(grid,neighb_x,neighb_y,1); //Mark it as to-explore
			}
			var node = instance_create_layer(0,0,"mazesolver_nodes",obj_node);
			node.parent_x = curr_x; //We reched the neighbor from here
			node.parent_y = curr_y;
			ds_grid_set(nodes,neighb_x,neighb_y,node);
		}
	}
	
	// We now have a series of nodes.
	// Every node in the path to destx,desty has a parent x,y , which can reach it.
	// We just have to *start* at destx,desty and loop backwards
	
	
	
}