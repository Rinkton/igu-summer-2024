extends Node2D


@onready var symmetric_link_res = preload("res://symmetry_link.tscn")
@onready var cur_side = $above

var character


func _ready():
	character = $character
	for object in $above.get_children():
		var new_object = object.duplicate()
		var object_symmetric_link = symmetric_link_res.instantiate()
		object_symmetric_link.obj = new_object
		object.add_child(object_symmetric_link)
		var new_object_symmetric_link = symmetric_link_res.instantiate()
		new_object_symmetric_link.obj = object
		new_object.add_child(new_object_symmetric_link)
		#new_object.set_collision_layer_value(1,false)
		$below.add_child(new_object)
		
func _physics_process(_delta):
	
	if Input.is_action_just_pressed("scroll_up"):
		for object in cur_side.get_children():
			object.position.y -= 3 * (1 if cur_side == $above else -1)
	elif Input.is_action_just_pressed("scroll_down"):
		for object in cur_side.get_children():
			object.position.y += 3 * (1 if cur_side == $above else -1)
	
	character.check_is_above()
	if character.is_above:
		cur_side = $above
	else:
		cur_side = $below
	
	for object in cur_side.get_children():
		var symmetric_object = object.get_node("symmetry_link").obj
		if cur_side == $above:
			symmetric_object.get_child(0).material = null
			symmetric_object.z_index = -1
			#if object.get("gravity_scale") and object.gravity_scale != 1:
				#object.gravity_scale = 1
		else:
			
			if object.get("gravity_scale") and object.gravity_scale != -1:
				pass
				#ProjectSettings.set_setting("physics/2d/default_gravity_vector", Vector2(0, 1))
		symmetric_object.global_position.y = (250 - object.global_position.y) + 250
		symmetric_object.rotation = -object.rotation
		symmetric_object.scale = Vector2(-object.scale.x,-object.scale.y)
		symmetric_object.global_position.x = object.global_position.x
		symmetric_object.get_node("CollisionShape2D").disabled = true
		object.get_node("CollisionShape2D").disabled = false
