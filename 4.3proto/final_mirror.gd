extends Mirror


@onready var summer_song = preload("res://Soundtrack/summer.mp3")

var final_camering = false
var lst_camera_pos_x
var first_text = false
var second_text = false


func _physics_process(delta):
	super(delta)
	if final_camering:
		var camera = get_tree().current_scene.get_node("camera")
		camera.set_physics_process(false)
		camera.global_position.x = move_toward(camera.global_position.x, lst_camera_pos_x+1000, 1500*delta)
		$AudioStreamPlayer2D.volume_db -= 5 * delta
	if first_text:
		var label = get_tree().current_scene.get_node("Label")
		var label3 = get_tree().current_scene.get_node("Label3")
		label.modulate.a = move_toward(label.modulate.a, 1, 1*delta)
		label3.modulate.a = move_toward(label3.modulate.a, 1, 1*delta)
	if second_text:
		var label2 = get_tree().current_scene.get_node("Label2")
		var label4 = get_tree().current_scene.get_node("Label4")
		label2.modulate.a = move_toward(label2.modulate.a, 1, 1*delta)
		label4.modulate.a = move_toward(label4.modulate.a, 1, 1*delta)
		if Input.is_action_just_pressed("esc_to_menu"):
			get_tree().change_scene_to_file("res://menu.tscn")


func _on_body_entered(body):
	if body.name == "character":
		get_tree().current_scene.get_node("AudioStreamPlayer").stop()
		$level_finished_audiostream.play()
		body.set_physics_process(false)
		body.get_node("idle").visible = false
		body.get_node("run").visible = false
		body.get_node("jump").visible = false
		get_tree().current_scene.get_node("VideoStreamPlayer").play()
		get_tree().current_scene.get_node("final_character").play()
		await get_tree().create_timer(3).timeout
		var camera = get_tree().current_scene.get_node("camera")
		lst_camera_pos_x = camera.global_position.x
		final_camering = true
		$Timer.start()

func _on_timer_timeout():
	get_tree().current_scene.get_node("AudioStreamPlayer").stream = summer_song
	get_tree().current_scene.get_node("AudioStreamPlayer").play()
	await get_tree().create_timer(10).timeout
	first_text = true
	await get_tree().create_timer(5).timeout
	second_text = true
