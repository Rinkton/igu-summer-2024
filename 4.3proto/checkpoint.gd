extends Area2D


func _process(_delta):
	if Global.lst_checkpoint_pos and Global.lst_checkpoint_pos.x == global_position.x:
		$Sprite2D.frame = 1
	else:
		$Sprite2D.frame = 0


func _on_body_entered(body):
	if body.name == "character":
		if $Sprite2D.frame == 0 and $Timer.is_stopped():
			$sound.play()
		var y = global_position.y if global_position.y < 250 else (250 - global_position.y) + 250
		Global.lst_checkpoint_pos = Vector2(global_position.x, y)
