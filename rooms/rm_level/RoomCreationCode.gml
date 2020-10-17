Initialize();
var level = instance_create_depth(0,0,0,asset_get_index("obj_level_" + string(global.curr_level_idx)));
LoadLevel(level);