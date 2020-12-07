// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_controls(lastkey, index){
	for(var i = 0; i<array_length_1d(global.array_of_controls); i++){
		if(i == index)
			continue;
		else if(lastkey == global.array_of_controls[i])
			return true;
		else
			continue;
	}
	return false;
}