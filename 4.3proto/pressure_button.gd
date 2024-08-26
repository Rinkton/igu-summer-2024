extends Area2D
class_name PressureButton


@export var node_path: NodePath


func _physics_process(_delta):
	if get_tree().current_scene.cur_side != get_parent():
		return
	var overlapping_bodies = get_overlapping_bodies()
	var i = 0
	while i < len(overlapping_bodies):
		if overlapping_bodies[i] is StaticBody2D:
			overlapping_bodies.remove_at(i)
		else:
			i+=1
	var above_node = get_tree().current_scene.get_node("above").get_node(NodePath(get_node(node_path).name))
	if len(overlapping_bodies) > 0:
		for body in get_overlapping_bodies():
			if not above_node.activated:
				above_node.activate()
				$activate.play()
				$AnimationPlayer.play("press")
	else:
		if above_node.activated:
			above_node.deactivate()
			$deactivate.play()
			$AnimationPlayer.play("idle")
	get_node("symmetry_link").obj.get_node("Sprite2D").frame = $Sprite2D.frame


func _on_body_entered(body):
	pass

func _on_body_exited(body):
	pass
