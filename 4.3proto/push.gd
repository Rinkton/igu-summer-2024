extends RigidBody2D


func _physics_process(delta):
	if get_tree().current_scene.is_scrolling:
		freeze = true
	else:
		freeze = false
