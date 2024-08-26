extends Area2D


var start_pos


func _ready():
	start_pos = global_position

func _process(_delta):
	if Global.lst_checkpoint_pos and Global.lst_checkpoint_pos.x == global_position.x:
		$Sprite2D.frame = 1
	else:
		$Sprite2D.frame = 0


func _on_body_entered(body):
	if body.name == "character":
		if $Sprite2D.frame == 0 and $Timer.is_stopped():
			$sound.play()
		var y = start_pos.y if start_pos.y < 250 else (250 - start_pos.y) + 250
		Global.lst_checkpoint_pos = Vector2(start_pos.x, y)
