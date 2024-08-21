extends Camera2D


@export var LERP_SPEED: float = 0.05

var target


func _ready():
	target = get_tree().current_scene.get_node("character")

func _physics_process(_delta):
	if is_instance_valid(target):
		var target_pos_x
		target_pos_x = int(lerp(self.global_position.x, target.position.x, LERP_SPEED))
		global_position = Vector2(target_pos_x, 250)
