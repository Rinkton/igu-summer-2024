extends Area2D


@export var node_path: NodePath


func _process(_delta):
	if get_tree().current_scene.cur_side != get_parent():
		return
	var above_node = get_tree().current_scene.get_node("above").get_node(NodePath(get_node(node_path).name))
	for body in get_overlapping_bodies():
		if body.name == "character" and Input.is_action_just_pressed("act"):
			if above_node.activated:
				above_node.deactivate()
				$Sprite2D.modulate.g = 0
				$Sprite2D.modulate.r = 1
			else:
				above_node.activate()
				$Sprite2D.modulate.g = 1
				$Sprite2D.modulate.r = 0
	get_node("symmetry_link").obj.get_node("Sprite2D").modulate.g = $Sprite2D.modulate.g
	get_node("symmetry_link").obj.get_node("Sprite2D").modulate.r = $Sprite2D.modulate.r


# NO set_up_symmetric_object()!!
