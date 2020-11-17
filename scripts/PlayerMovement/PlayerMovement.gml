// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.adjust_speed = 9;

function toggleMaze(){
	toggled = keyboard_check_pressed(ord(global.array_of_controls[5]));
	if toggled && global.maze_on {
		global.maze_toggled = true;
		global.maze_on = false;
		toggled = false;
	}

	if toggled && !global.maze_on {
		global.maze_toggled = false;
		global.maze_on = true;
		toggled = false;
		while(instance_number(obj_maze_solver_arrow) > 0){
			instance_destroy(instance_find(obj_maze_solver_arrow,0));
		}
	}
}
function PlayerMovementUp(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_up)) && (cooldown < 1)){
			var status=GetTileStatus(playerx, playery-1);
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playery-=1;
					break;
				case tilestatus.interaction:
					InteractWithTile(playerx, playery-1);
					break;
		}
		cooldown = global.adjust_speed;
		if(global.maze_toggled)
			solveMaze(1,1);
			//TODO -- should be run once after every step. Refactor to make less messy?
			//TODO -- should only be run if maze solving toggled on.
			//TODO make target be correctly set (i.e. not always (1,1))
		}
	}
}
function PlayerMovementDown(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_down)) && (cooldown < 1)){
			var status=GetTileStatus(playerx,playery+1);
			switch(status){
			case tilestatus.blocked:
				break;
			case tilestatus.passable:
				playery+=1;
				break;
			case tilestatus.interaction:
				InteractWithTile(playerx,playery+1);
				break;
			}
			cooldown = global.adjust_speed;
			if(global.maze_toggled)
				solveMaze(1,1);
			//TODO -- should be run once after every step. Refactor to make less messy?
			//TODO -- should only be run if maze solving toggled on.
			//TODO make target be correctly set (i.e. not always (1,1))
			}
			
		}
	}


function PlayerMovementLeft(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_left)) && (cooldown < 1)){
			var status=GetTileStatus(playerx-1,playery);
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playerx-=1;
					break;
				case tilestatus.interaction:
					InteractWithTile(playerx-1,playery);
					break;
			}
			cooldown = global.adjust_speed
			if(global.maze_toggled)
				solveMaze(1,1);
			//TODO -- should be run once after every step. Refactor to make less messy?
			//TODO -- should only be run if maze solving toggled on.
			//TODO make target be correctly set (i.e. not always (1,1))
		}
			
	}
}

function PlayerMovementRight(char){
	with(obj_player){
		if((keyboard_check(ord(char)) || keyboard_check(vk_right)) && (cooldown < 1)){
			var status=GetTileStatus(playerx+1,playery);
			switch(status){
				case tilestatus.blocked:
					break;
				case tilestatus.passable:
					playerx+=1;
					break;
				case tilestatus.interaction:
					InteractWithTile(playerx+1,playery);
					break;
			}
			cooldown = global.adjust_speed;
			if(global.maze_toggled)
				solveMaze(1,1);
			//TODO -- should be run once after every step. Refactor to make less messy?
			//TODO -- should only be run if maze solving toggled on.
			//TODO make target be correctly set (i.e. not always (1,1))
		}
		
	}
}