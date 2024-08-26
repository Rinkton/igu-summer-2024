extends Area2D
class_name Mirror


@export var unlock_level: int


func _physics_process(delta):
	for overlapping_body in $Area2D.get_overlapping_bodies():
		if overlapping_body.name == "character":
			overlapping_body.set_physics_process(false)
			overlapping_body.get_node("idle").visible = false
			overlapping_body.get_node("jump").visible = false
			overlapping_body.get_node("run").visible = true
			overlapping_body.get_node("run").play()
			var a = (global_position.x - overlapping_body.global_position.x) / 120
			if a <= 1:
				overlapping_body.get_node("run").modulate.a = a
			else:
				overlapping_body.get_node("run").modulate.a = 1
			overlapping_body.global_position.x += 100 * delta


func _on_body_entered(body):
	if body.name == "character":
		get_tree().current_scene.get_node("AudioStreamPlayer").stop()
		$level_finished_audiostream.play()
		body.set_physics_process(false)
		body.get_node("idle").visible = false
		body.get_node("run").visible = false
		body.get_node("jump").visible = false
		if unlock_level: # not equal zero
			if not(unlock_level in Global.unlocked_levels):
				Global.unlocked_levels.append(unlock_level)
		Global.timestamp = 0
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://menu.tscn")
