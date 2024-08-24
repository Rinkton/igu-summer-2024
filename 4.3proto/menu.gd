extends Node2D


func disable_all_point_lights():
	$level1/PointLight2D.visible = false
	$level2/PointLight2D2.visible = false
	$level3/PointLight2D3.visible = false
	$level4/PointLight2D4.visible = false


func _on_level_1_input_event(viewport, event, shape_idx):
	disable_all_point_lights()
	$level1/PointLight2D.visible = true
	
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_level_2_input_event(viewport, event, shape_idx):
	pass

func _on_level_3_input_event(viewport, event, shape_idx):
	pass # Replace with function body.

func _on_level_4_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
