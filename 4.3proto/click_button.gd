extends Area2D


@export var node_path: NodePath


func _process(_delta):
	for body in get_overlapping_bodies():
		if body.name == "character" and Input.is_action_just_pressed("act"):
			get_node(node_path).activate()
