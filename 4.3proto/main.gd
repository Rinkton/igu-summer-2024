extends Node2D

var current_level

@onready var above_material = preload("res://above_material.tres")
@onready var symmetric_link_res = preload("res://symmetry_link.tscn")
@onready var cur_side 
@onready var character = $default_node/character

#replace _ready with create_level(), so can be called for each level creation

func create_level(level_selected):
	
	for level in $levels.get_children():
		level.process_mode = Node.PROCESS_MODE_DISABLED
		level.visible = false
		
	if level_selected == 1:
		current_level = $levels/level_1
		
	elif level_selected == 2:
		current_level = $levels/level_2
		
	elif level_selected == 3:
		current_level = $levels/level_3
		
	elif level_selected == 4:
		current_level = $levels/level_4
	
	current_level.process_mode = Node.PROCESS_MODE_INHERIT
	current_level.visible = true
	
	$default_node/menu/Sprite2D.visible = false
	$default_node/menu/Sprite2D.process_mode = Node.PROCESS_MODE_DISABLED
	
	for object in current_level.get_node('above').get_children():
		
		if not(object is RigidBody2D): # Idk, but the push is feeling bad when I lay material on its sprite
			for child in object.get_children():
				if child is Sprite2D:
					child.material = above_material
					
		var new_object = object.duplicate()
		var object_symmetric_link = symmetric_link_res.instantiate()
		object_symmetric_link.obj = new_object
		object.add_child(object_symmetric_link)
		var new_object_symmetric_link = symmetric_link_res.instantiate()
		new_object_symmetric_link.obj = object
		new_object.add_child(new_object_symmetric_link)
		#new_object.set_collision_layer_value(1,false)
		current_level.get_node('below').add_child(new_object)
		
	if Global.lst_checkpoint_pos:
		character.global_position = Global.lst_checkpoint_pos
	$default_node/camera.global_position.x = character.global_position.x
	level_needs_setup = false
	
var level_needs_setup = true

func _process(delta):
	
	if level_needs_setup:
		return
		
	if character.is_above:
		cur_side = current_level.get_node('above')
	else:
		cur_side = current_level.get_node('below')
	
	#if len($menu/level_objects/level_1.get_children()) == 0 and level_needs_setup:
		#$".".create_level()
		#level_needs_setup = false
		
	## NOT FORGET TO SET NULL IN GLOBAL.LST_CHECKPOINT_POS WHEN YOU EXIT LEVEL OR FINISHING IT UP
	
	#if the problem with the wiggling push while scrolling will cause too bad, then try smthn like that
	for object in cur_side.get_children():
		if object is RigidBody2D:
			object.freeze = false

	if Input.is_action_just_pressed("scroll_up"):
		for object in cur_side.get_children():
			object.position.y -= 180 * delta * (1 if cur_side == current_level.get_node('above') else -1)
	elif Input.is_action_just_pressed("scroll_down"):
		for object in cur_side.get_children():
			object.position.y += 180 * delta * (1 if cur_side == current_level.get_node('above') else -1)
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

	character.check_is_above()

	
	set_symmetric()

func set_symmetric():
	
	if level_needs_setup == false: # set to true to run some scene which isn't a complete level
		for object in cur_side.get_children():
			var symmetric_object = object.get_node("symmetry_link").obj
			if cur_side == current_level.get_node('above'):
				for child in symmetric_object.get_children():
					if child is Sprite2D:
						child.material = null
				symmetric_object.z_index = -1
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
			# for some specific parameters of specific objects
			if object.has_method("set_up_symmetric_object"):
				object.set_up_symmetric_object()
