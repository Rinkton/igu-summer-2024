extends Node2D


var start_x_pos


func _ready():
	visible = false
	$Content.modulate.a = 0
	start_x_pos = global_position.x
	await get_tree().create_timer(0.1).timeout
	if get_tree().current_scene.get_node("character").global_position.x > $Area2D/CollisionShape2D.global_position.x:
		$Area2D/CollisionShape2D.disabled = true
		visible = false


func _process(_delta):
	global_position.x = 0 + get_tree().current_scene.get_node("camera").global_position.x - 500
	$Area2D.position.x = start_x_pos - global_position.x


func set_up_symmetric_object():
	get_node("symmetry_link").obj.z_index = z_index


func _on_area_2d_body_entered(body):
	if body.name == "character":
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		$AnimationPlayer.play("fade")
		for child in get_parent().get_children():
			if child.name.contains("tip") and child != self:
				child.visible = false
		visible = true
		for child in $Content.get_children():
			if child.name.contains("AnimatedSprite"):
				child.play()
