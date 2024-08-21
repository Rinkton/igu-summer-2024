extends Area2D


@export var node_path: NodePath


func _process(delta):
	for body in get_overlapping_bodies():
		if body.name == "character" and Input.is_action_just_pressed("act"):
			if get_node(node_path).activated:
				get_node(node_path).deactivate()
				$Sprite2D.modulate.g = 0
				$Sprite2D.modulate.r = 1
			else:
				get_node(node_path).activate()
				$Sprite2D.modulate.g = 1
				$Sprite2D.modulate.r = 0


func set_up_symmetric_object():
	get_node("symmetry_link").obj.get_node("Sprite2D").modulate.g = $Sprite2D.modulate.g
	get_node("symmetry_link").obj.get_node("Sprite2D").modulate.r = $Sprite2D.modulate.r
