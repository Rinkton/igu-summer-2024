extends Node2D


var character


func _ready():
	character = $character
	for object in $world_objects.get_children():
		var new_object = object.duplicate()
		#new_object.set_collision_layer_value(1,false)
		object.add_child(new_object)
		
func _process(_delta):
	
	if Input.is_action_just_pressed("scroll_up"):
		for object in $world_objects.get_children():
			object.position.y -= 3
	elif Input.is_action_just_pressed("scroll_down"):
		for object in $world_objects.get_children():
			object.position.y += 3
	
	
	for object in $world_objects.get_children():
		#object.global_position += Vector2(1,-1)
		#object.get_child(2).set_collision_layer_value(1,false)
		object.get_child(2).get_child(0).material = null
		object.get_child(2).z_index = -1
		object.get_child(2).rotation = -object.rotation * 2
		object.get_child(2).scale = Vector2(-1,-1)
		object.get_child(2).global_position.x = object.global_position.x
		object.get_child(2).global_position.y = (250 - object.global_position.y) + 250 
		#new_object.global_position.y = (250 - object.global_position.y)  + 250
		if character.is_above:
			object.get_child(2).get_node("CollisionShape2D").disabled = true
			object.get_node("CollisionShape2D").disabled = false
		else:
			object.get_child(2).get_node("CollisionShape2D").disabled = false
			object.get_node("CollisionShape2D").disabled = true
