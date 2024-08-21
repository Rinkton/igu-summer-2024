extends StaticBody2D


var activated = false


func activate():
	$AnimationPlayer.play("open")
	activated = true

func deactivate():
	$AnimationPlayer.play_backwards("open")
	activated = false
