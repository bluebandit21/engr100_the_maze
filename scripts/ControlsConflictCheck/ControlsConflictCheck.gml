// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_controls(control,controlsArray, index){
	for(var i = 0; i<array_length_1d(controlsArray); i++){
		if(i == index)
			continue;
		else if(string_upper(control) == controlsArray[i])
			return false;
		else
			continue;
	}
	return true;
}

function level_complete(){
	
}