// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_control(controlNumber){
	if(keyboard_lastkey != -1){
		if(check_controls(keyboard_lastkey, controlNumber))
			show_message("Key already in use");
		else{
			if(keyboard_lastkey == vk_enter)
				keyboard_lastkey = global.array_of_controls[controlNumber];
			else{
				global.array_of_controls[controlNumber] = keyboard_lastkey;
				keyboard_lastkey = -1;
			}
		}
	} 
	global.adjusting_controls = true;
}

function print_keys(control){
	var str2 = " ";
	if (control >= 48 && control <= 90) {
		return chr(control);
	}
	else{
		switch (control) {
	        case vk_enter: str2 = "Enter"; break;
	        case vk_left: str2 = "←"; break;
	        case vk_right: str2 = "→"; break;
	        case vk_up: str2 = "↑"; break;
	        case vk_down: str2 = "↓"; break;
	        case vk_escape: str2 = "Esc"; break;
	        case vk_space: str2 = "Space"; break;
	        case vk_shift: str2 = "Shift"; break;
	        case vk_control: str2 = "Ctrl"; break;
	        case vk_alt: str2 = "Alt"; break;
	        case vk_backspace: str2 = "Backspace"; break;
	        case vk_tab: str2 = "Tab"; break;
	        case vk_home: str2 = "Home"; break;
	        case vk_end: str2 = "End"; break;
	        case vk_delete: str2 = "Del"; break;
	        case vk_insert: str2 = "Ins"; break;
	        case vk_pageup: str2 = "Page Up"; break;
	        case vk_pagedown: str2 = "Page Down"; break;
	        case vk_pause: str2 = "Pause"; break;
	        case vk_printscreen: str2 = "Printscreen"; break;
	        case vk_f1: str2 = "F1"; break;
	        case vk_f2: str2 = "F2"; break;
	        case vk_f3: str2 = "F3"; break;
	        case vk_f4: str2 = "F4"; break;
	        case vk_f5: str2 = "F5"; break;
	        case vk_f6: str2 = "F6"; break;
	        case vk_f7: str2 = "F7"; break;
	        case vk_f8: str2 = "F8"; break;
	        case vk_f9: str2 = "F9"; break;
	        case vk_f10: str2 = "F10"; break;
	        case vk_f11: str2 = "F11"; break;
	        case vk_f12: str2 = "F12"; break;
		}
		return str2;
	}
}