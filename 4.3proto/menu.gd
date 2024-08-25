extends Node2D


func _ready():
	Global.lst_checkpoint_pos = null
	for level_number in Global.lst_unlocked_levels:
		get_node("level" + str(level_number)).unlock_silently()
	var new_unlocked_levels = difference(Global.unlocked_levels, Global.lst_unlocked_levels)
	for level_number in new_unlocked_levels:
		get_node("level" + str(level_number)).unlock_loudly()
	Global.lst_unlocked_levels = Global.unlocked_levels


func difference(arr1, arr2):
	var only_in_arr1 = []
	for v in arr1:
		if not (v in arr2):
			only_in_arr1.append(v)
	return only_in_arr1
