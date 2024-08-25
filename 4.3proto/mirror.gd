extends Area2D


@export var unlock_level: int


func _on_body_entered(body):
	if body.name == "character":
		$level_finished_audiostream.play()
		body.set_physics_process(false)
		body.get_node("idle").visible = false
		body.get_node("run").visible = false
		body.get_node("jump").visible = false
		if unlock_level: # not equal zero
			if not(unlock_level in Global.unlocked_levels):
				Global.unlocked_levels.append(unlock_level)
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://menu.tscn")
