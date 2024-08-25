extends Area2D


@export var level_path: String

var unlocking_loudly = false
var unlocking_loudly_spd = 1


func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	connect("input_event", _on_input_event)

func _process(delta):
	if unlocking_loudly:
		$Sprite2D.modulate.a = move_toward($Sprite2D.modulate.a, 0, unlocking_loudly_spd * delta)


func unlock_silently():
	$Sprite2D.modulate.a = 0

func unlock_loudly():
	unlocking_loudly = true


func _on_mouse_entered():
	if $Sprite2D.modulate.a != 0:
		return
	$PointLight2D.visible = true

func _on_mouse_exited():
	if $Sprite2D.modulate.a != 0:
		return
	$PointLight2D.visible = false

func _on_input_event(viewport, event, shape_idx):
	if $Sprite2D.modulate.a != 0:
		return
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		get_tree().change_scene_to_file(level_path)
