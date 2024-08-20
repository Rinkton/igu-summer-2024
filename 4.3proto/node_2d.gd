extends RigidBody2D

func _process(_delta):
	if len($Area2D.get_overlapping_bodies()) == 0:
		pass
		#print('yyyyy')
		#linear_velocity = Vector2(0,0)
