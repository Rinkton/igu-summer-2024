extends Area2D


@export var node_path: NodePath


func _physics_process(_delta):
	var overlapping_bodies = get_overlapping_bodies()
	var i = 0
	while i < len(overlapping_bodies):
		if overlapping_bodies[i] is StaticBody2D:
			overlapping_bodies.remove_at(i)
		else:
			i+=1
	if len(overlapping_bodies) > 0:
		for body in get_overlapping_bodies():
			if not get_node(node_path).activated:
				get_node(node_path).activate()
				$AnimationPlayer.play("press")
	else:
		if get_node(node_path).activated:
			get_node(node_path).deactivate()
			$AnimationPlayer.play_backwards("press")


func set_up_symmetric_object():
	if get_parent().name == "above":
		get_node("symmetry_link").obj.get_node("Sprite2D").scale = $Sprite2D.scale
		get_node("symmetry_link").obj.get_node("Sprite2D").position = $Sprite2D.position
	else:
		$Sprite2D.scale = get_node("symmetry_link").obj.get_node("Sprite2D").scale
		$Sprite2D.position = get_node("symmetry_link").obj.get_node("Sprite2D").position


func _on_body_entered(body):
	pass

func _on_body_exited(body):
	pass
