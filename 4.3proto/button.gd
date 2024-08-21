extends Area2D


@export var gate_path: NodePath


func _on_body_entered(body):
	if not(body is StaticBody2D) and not get_node(gate_path).activated:
		get_node(gate_path).activate()

func _on_body_exited(_body):
	for overlapping_body in get_overlapping_bodies():
		if not(overlapping_body is StaticBody2D):
			return
	get_node(gate_path).deactivate()
