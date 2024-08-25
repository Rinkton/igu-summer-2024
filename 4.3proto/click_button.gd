extends Area2D


@export var node_path: NodePath


func _process(_delta):
	if get_tree().current_scene.cur_side != get_parent():
		return
	var above_node = get_tree().current_scene.get_node("above").get_node(NodePath(get_node(node_path).name))
	for body in get_overlapping_bodies():
		if body.name == "character" and Input.is_action_just_pressed("act") and $Sprite2D.frame != 1:
			above_node.activate()
			$Sprite2D.frame = 1
			await get_tree().create_timer(0.2).timeout
			$Sprite2D.frame = 0
	get_node("symmetry_link").obj.get_node("Sprite2D").frame = $Sprite2D.frame
