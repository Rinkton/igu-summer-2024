extends StaticBody2D


var is_symmetry = false
var symmetry_self 


func _ready():
	if not is_symmetry:
		symmetry_self = self.duplicate()
		set_up_symmetry_self()
		get_tree().current_scene.get_node("mirror_world_objects").add_child(symmetry_self)

func _physics_process(delta):
	if not is_symmetry:
		set_up_symmetry_self()


func set_up_symmetry_self():
	symmetry_self.is_symmetry = true # otherwise the symmetry duplicate will create its own symmetry duplicate and so on
	symmetry_self.get_child(0).material = null
	symmetry_self.z_index = -1
	symmetry_self.rotation = -rotation * 2
	symmetry_self.scale = Vector2(-scale.x,-scale.y)
	symmetry_self.global_position.y = (250 - global_position.y) + 250
