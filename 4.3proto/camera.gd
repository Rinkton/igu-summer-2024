extends Camera2D


@export var LERP_SPEED: float = 0.05

var target


func _ready():
	#target = get_tree().current_scene.get_node("character")
	target = $"../character"
	global_position.y = 250

func _physics_process(_delta):
	if is_instance_valid(target):
		var target_pos_x
		target_pos_x = int(lerp(self.global_position.x, target.position.x, LERP_SPEED))
		if target_pos_x > 500:
			global_position = Vector2(target_pos_x, 250)
		else:
			global_position.x = 500
