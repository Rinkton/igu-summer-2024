extends CanvasLayer

#when a level is beaten, add it to 'unlocked_levels'

var levels = [1,2,3,4,5,6]
var unlocked_levels = [1]

func _on_level_1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$"../..".create_level(1)

func _on_level_2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$"../..".create_level(2)

func _on_level_3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$"../..".create_level(3)

func _on_level_4_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$"../..".create_level(4)

func _on_level_5_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$"../..".create_level(5)

func _on_level_6_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$"../..".create_level(6)


func start_level():
	pass
	#
	## if level is unlocked
	#if level in unlocked_levels:
	#
		#if level == 1:
			#$"..".create_level(1) 
			##for object in $level_objects/level_1.get_children():
				##object.get_parent().remove_child(object)
				##object.process_mode = Node.PROCESS_MODE_INHERIT
				##object.visible = true
				##$"../above".call_deferred("add_child",object) 
				##
			##$"../character".global_position = Vector2(100,-100)
			##
			##$Sprite2D.visible = false
		#
		#elif level == 2:
		
