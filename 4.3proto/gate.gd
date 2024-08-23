extends StaticBody2D


var activated = false


func activate():
	$AnimationPlayer.play("open")
	activated = true

func deactivate():
	$AnimationPlayer.play_backwards("open")
	activated = false

func set_up_symmetric_object():
	#if get_parent().name == "above":
		get_node("symmetry_link").obj.get_node("Sprite2D").scale = $Sprite2D.scale
		get_node("symmetry_link").obj.get_node("Sprite2D").position = $Sprite2D.position
		get_node("symmetry_link").obj.get_node("CollisionShape2D").position = $CollisionShape2D.position
		get_node("symmetry_link").obj.get_node("CollisionShape2D").scale = $CollisionShape2D.scale
		get_node("symmetry_link").obj.get_node("CollisionShape2D").shape.size = $CollisionShape2D.shape.size
	#else:
	#	$Sprite2D.scale
	#	$Sprite2D.position
	#	$CollisionShape2D.position
	#	$CollisionShape2D.scale
	#	$CollisionShape2D.shape.size
