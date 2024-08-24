extends StaticBody2D

var brighten = true
func _on_timer_timeout():
	
	if brighten == true:
		var tween = $".".create_tween()
		
		tween.tween_property($PointLight2D, "energy", 0.6, 1)
		brighten = false
	else:
		var tween = $".".create_tween()
		
		tween.tween_property($PointLight2D, "energy", 1, 1)
		brighten = true
	
	
