extends CanvasLayer

#when a level is beaten, add it to 'unlocked_levels'

var levels = [1,2,3,4,5,6]
var unlocked_levels = [1]
var in_level = false

func _on_level_1_input_event(_viewport, event, _shape_idx):
	if in_level == false:
		$level1/PointLight2D.visible = true
		$level2/PointLight2D2.visible = false
		$level3/PointLight2D3.visible = false
		$level4/PointLight2D4.visible = false
		
		if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
			$"../..".create_level(1)
			in_level = true
			
func _on_level_2_input_event(_viewport, event, _shape_idx):
	if in_level == false:
		$level1/PointLight2D.visible = false
		$level2/PointLight2D2.visible = true
		$level3/PointLight2D3.visible = false
		$level4/PointLight2D4.visible = false
		if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
			$"../..".create_level(2)
			in_level = true
			
func _on_level_3_input_event(_viewport, event, _shape_idx):
	if in_level == false:
		$level1/PointLight2D.visible = false
		$level2/PointLight2D2.visible = false
		$level3/PointLight2D3.visible = true
		$level4/PointLight2D4.visible = false
		if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
			$"../..".create_level(3)
			in_level = true
			
func _on_level_4_input_event(_viewport, event, _shape_idx):
	
	if in_level == false:
		$level1/PointLight2D.visible = false
		$level2/PointLight2D2.visible = false
		$level3/PointLight2D3.visible = false
		$level4/PointLight2D4.visible = true
		if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
			$"../..".create_level(4)
			in_level = true
