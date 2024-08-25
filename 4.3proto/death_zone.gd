extends Area2D


func _on_body_entered(body):
	if body.name == "character":
		Global.timestamp = $"../AudioStreamPlayer".get_playback_position()
		get_tree().call_deferred("reload_current_scene")
		
