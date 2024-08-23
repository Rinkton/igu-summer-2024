extends Area2D


func _process(delta):
	if get_tree().current_scene.get_node("character").global_position.x > global_position.x:
		get_tree().current_scene.can_scroll = true
		print("CAN SCROLL")
		queue_free()
