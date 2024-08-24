extends RigidBody2D


func _physics_process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body != self and body is RigidBody2D:
			linear_damp = 2
