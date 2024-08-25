extends Area2D


func _on_body_entered(body):
	#Global.timestamp = $"../AudioStreamPlayer".get_playback_position()
	if body.name == "character":
		get_tree().call_deferred("reload_current_scene")
		
