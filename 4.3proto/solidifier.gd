extends StaticBody2D


@onready var shape = preload("res://solidifier_shape.tres")

var activated = false


func activate():
	$CollisionShape2D.shape = shape
	$Sprite2D.modulate.a = 1
	activated = true

func deactivate():
	$CollisionShape2D.shape = null
	$Sprite2D.modulate.a = 0.6
	activated = false
