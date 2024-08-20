extends Area2D


@export var gate_path: NodePath


func _on_body_entered(body):
	if body is RigidBody2D:
		get_node(gate_path).activate()
		queue_free()
