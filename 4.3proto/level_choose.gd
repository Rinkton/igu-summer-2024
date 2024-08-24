extends Area2D


@export var level_path: String


func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	connect("input_event", _on_input_event)


func _on_mouse_entered():
	$PointLight2D.visible = true

func _on_mouse_exited():
	$PointLight2D.visible = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		get_tree().change_scene_to_file(level_path)
	
