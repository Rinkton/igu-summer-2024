extends Area2D


func _on_body_entered(body):
	if body.name == "character":
		get_tree().reload_current_scene()
