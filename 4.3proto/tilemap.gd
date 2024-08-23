extends TileMap


func _ready():
	await get_tree().create_timer(0.2).timeout
	if get_parent().get_parent().name == "below":
		material = null
		for child in get_parent().get_children():
			if child.name.contains("above"):
				child.material = null
