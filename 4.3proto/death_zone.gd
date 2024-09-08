extends Area2D


func _on_body_entered(body):
	if body.name == "character":
		get_tree().current_scene.call_deferred("reset_level")
		
