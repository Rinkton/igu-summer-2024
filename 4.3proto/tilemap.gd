extends TileMap


func _ready():
	await get_tree().create_timer(0.2).timeout
	if get_parent().get_parent().name == "below":
		material = null
		get_parent().get_node("above_tilemap").material = null
