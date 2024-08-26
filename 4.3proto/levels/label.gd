extends Label


func set_up_symmetric_object():
	get_node("symmetry_link").obj.global_position.y = (250 - global_position.y) + 250
	get_node("symmetry_link").obj.rotation = -rotation
	get_node("symmetry_link").obj.scale = Vector2(scale.x,-scale.y)
	get_node("symmetry_link").obj.global_position.x = global_position.x
