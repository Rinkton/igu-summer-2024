extends Area2D


@export var what: NodePath
@export var rot: float


func _on_body_entered(body):
	if body.name == "character":
		get_node(what).rotation = rot
		$CollisionShape2D.disabled = true
