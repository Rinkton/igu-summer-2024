extends Area2D


@export var node_path: NodePath


func _physics_process(_delta):
	if len(get_overlapping_bodies()) > 0:
		for body in get_overlapping_bodies():
			if body is StaticBody2D:
				continue
			if not get_node(node_path).activated:
				get_node(node_path).activate()
				$AnimationPlayer.play("press")
	else:
		if get_node(node_path).activated:
			get_node(node_path).deactivate()
			$AnimationPlayer.play_backwards("press")


func set_up_symmetric_object():
	get_node("symmetry_link").obj.get_node("Sprite2D").scale = $Sprite2D.scale
	get_node("symmetry_link").obj.get_node("Sprite2D").position = $Sprite2D.position


func _on_body_entered(body):
	pass

func _on_body_exited(body):
	pass
