extends Area2D


func _process(_delta):
	if Global.lst_checkpoint_pos and Global.lst_checkpoint_pos.x == global_position.x:
		modulate.b = 1
	else:
		modulate.b = 0.4


func _on_body_entered(body):
	if body.name == "character":
		Global.lst_checkpoint_pos = global_position
