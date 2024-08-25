extends StaticBody2D


@export var rot_spd = 2.5

var rot_acc = 5
var rot_dec = -5
var start_rot_spd
var target_rot_spd
var lst_side_name = "above"


func _ready():
	start_rot_spd = rot_spd
	target_rot_spd = start_rot_spd

func _physics_process(delta):
	var cur_side_name = ("above" if get_tree().current_scene.cur_side.name == "above" else "below")
	if cur_side_name != lst_side_name:
		target_rot_spd = 0
	rot_spd = move_toward(rot_spd, target_rot_spd, rot_acc*delta)
	if rot_spd < 0.1:
		target_rot_spd = start_rot_spd
	rotation += rot_spd * delta
	lst_side_name = cur_side_name
