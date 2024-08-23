extends Marker2D


@export var cooldown: float = 0.5
@export var what : PackedScene


func _ready():
	$Timer.wait_time = cooldown


func activate():
	if not $Timer.is_stopped():
		return
	var side = get_parent()
	var object = what.instantiate()
	object.global_position = global_position
	side.add_child(object)
	var new_object = get_tree().current_scene.create_symmetric_object(object)
	if side == get_tree().current_scene.get_node("above"):
		get_tree().current_scene.get_node("below").add_child(new_object)
	else:
		get_tree().current_scene.get_node("above").add_child(new_object)
	$Timer.start()
