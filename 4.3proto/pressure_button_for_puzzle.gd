extends PressureButton


@export var to_what: NodePath


func _physics_process(_delta):
	global_transform = get_node(to_what).get_node("whatto").global_transform
	super(_delta)
