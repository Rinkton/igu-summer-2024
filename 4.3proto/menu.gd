extends Node2D


func _ready():
	Global.lst_checkpoint_pos = null
	var loaded_levels = load_from_file()
	if len(loaded_levels) > len(Global.unlocked_levels):
		Global.unlocked_levels = loaded_levels
	else:
		save_to_file()
	for level_number in Global.lst_unlocked_levels:
		get_node("level" + str(level_number)).unlock_silently()
	var new_unlocked_levels = difference(Global.unlocked_levels, Global.lst_unlocked_levels)
	for level_number in new_unlocked_levels:
		get_node("level" + str(level_number)).unlock_loudly()
	Global.lst_unlocked_levels = Global.unlocked_levels.duplicate()


func difference(arr1, arr2):
	var only_in_arr1 = []
	for v in arr1:
		if not (v in arr2):
			only_in_arr1.append(v)
	return only_in_arr1

func save_to_file():
	var file = FileAccess.open("user://reflectica.dat", FileAccess.WRITE)
	file.store_string(str(Global.unlocked_levels))
	print("saved", str(Global.unlocked_levels))

func load_from_file():
	var file = FileAccess.open("user://reflectica.dat", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		file.close()
		print("loaded", str_to_var(content))
		return str_to_var(content)
	else:
		print("loaded", "failed so []")
		return []
