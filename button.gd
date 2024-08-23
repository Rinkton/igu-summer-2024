extends Area2D


@export var node_path: NodePath


func set_up_symmetric_object():
	get_node("symmetry_link").obj.get_node("Sprite2D").scale = $Sprite2D.scale
	get_node("symmetry_link").obj.get_node("Sprite2D").position = $Sprite2D.position


func _on_body_entered(body):
	if not(body is StaticBody2D) and not get_node(node_path).activated:
		get_node(node_path).activate()
		$AnimationPlayer.play("press")

func _on_body_exited(_body):
	for overlapping_body in get_overlapping_bodies():
		if not(overlapping_body is StaticBody2D):
			return
	get_node(node_path).deactivate()
	$AnimationPlayer.play_backwards("press")
