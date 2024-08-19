extends Node2D

var obst1 = preload('res://obst1.tscn')


func _process(_delta):
	if Input.is_action_just_pressed("scroll_up"):
		for object in $world_objects.get_children():
			object.position.y -= 3
	elif Input.is_action_just_pressed("scroll_down"):
		for object in $world_objects.get_children():
			object.position.y += 3
