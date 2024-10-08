extends StaticBody2D


@onready var shape = preload("res://solidifier_shape.tres")

var activated = false


func _process(_delta):
	if get_parent().name == "above":
		get_node("symmetry_link").obj.get_node("Sprite2D").frame = $Sprite2D.frame
		get_node("symmetry_link").obj.get_node("Sprite2D").modulate.a = $Sprite2D.modulate.a
		get_node("symmetry_link").obj.get_node("CollisionShape2D").shape = $CollisionShape2D.shape


func activate():
	$CollisionShape2D.set_deferred("shape", shape)
	$Sprite2D.frame = 1
	$Sprite2D.modulate.a = 1
	activated = true

func deactivate():
	$CollisionShape2D.set_deferred("shape", null)
	$Sprite2D.frame = 0
	$Sprite2D.modulate.a = 0.6
	activated = false
