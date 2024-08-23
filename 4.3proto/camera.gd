extends Camera2D


@export var LERP_SPEED: float = 0.05

var target


func _ready():
	#target = get_tree().current_scene.get_node("character")
	target = $"../character"

func _physics_process(_delta):
	if is_instance_valid(target):
		var target_pos_x
		if target.position.x > 500:
			target_pos_x = int(lerp(self.global_position.x, target.position.x, LERP_SPEED))
		else:
			target_pos_x = int(lerp(self.global_position.x, 500.0, LERP_SPEED))
		global_position = Vector2(target_pos_x, 250)
