extends Node2D

@export var can_scroll = true

@onready var above_material = preload("res://above_material.tres")
@onready var symmetric_link_res = preload("res://symmetry_link.tscn")
@onready var cur_side 
@onready var character = $character

var level_needs_setup = true
var scroll_max_spd
var scroll_acc
var scroll_dec
var scroll_vel = 0

var in_menu = true
#replace _ready with create_level(), so can be called for each level creation

func _ready(): ################################
	$AudioStreamPlayer.play(Global.timestamp)
	$CanvasLayer.process_mode = Node.PROCESS_MODE_DISABLED
	$CanvasLayer.visible = false
	print('run')
	for object in $above.get_children():
		
		if not(object is RigidBody2D): # Idk, but the push is feeling bad when I lay material on its sprite
			for child in object.get_children():
				if child is Sprite2D:
					child.material = above_material
					
		var new_object = create_symmetric_object(object)
		#new_object.set_collision_layer_value(1,false)
		$below.add_child(new_object)
		
	if Global.lst_checkpoint_pos:
		character.global_position = Global.lst_checkpoint_pos
	$camera.global_position.x = character.global_position.x if character.global_position.x > 500 else 500
	if character.is_above:
		cur_side = $above
	else:
		cur_side = $below
	set_symmetric()

func _physics_process(delta):
	
	
	if Input.is_action_just_pressed("esc_to_menu"):
		$CanvasLayer.process_mode = Node.PROCESS_MODE_ALWAYS
		$CanvasLayer.visible = true
		
	#if len($menu/level_objects/level_1.get_children()) == 0 and level_needs_setup: ################################
	#	$".".create_level()
	#	level_needs_setup = false
	# NOT FORGET TO SET NULL IN GLOBAL.LST_CHECKPOINT_POS WHEN YOU EXIT LEVEL OR FINISHING IT UP
	"""
	if the problem with the wiggling push while scrolling will cause too bad, then try smthn like that
	for object in cur_side.get_children():
		if object is RigidBody2D:
			object.freeze = false
	"""
	if Input.is_action_just_pressed("reset"):
		Global.timestamp = $AudioStreamPlayer.get_playback_position()
		get_tree().reload_current_scene()
		
	character.check_is_above()

	if character.is_above:
		cur_side = $above
	else:
		cur_side = $below
	set_symmetric()
	
	if can_scroll:
		if Input.is_action_pressed("scroll_down") or Input.is_action_pressed("scroll_up"): # arrows
			scroll_max_spd = 135
			scroll_acc = 6000
			scroll_dec = 2000
		else:
			scroll_max_spd = 180
			scroll_acc = 4000
			scroll_dec = 2000
		if Input.is_action_just_pressed("scroll_up") or Input.is_action_pressed("scroll_down"):
			scroll_vel = move_toward(scroll_vel, scroll_max_spd, scroll_acc*delta)
			
		elif Input.is_action_just_pressed("scroll_down") or Input.is_action_pressed("scroll_up"):
			scroll_vel = move_toward(scroll_vel, -scroll_max_spd, scroll_acc*delta)
		else:
			scroll_vel = move_toward(scroll_vel, 0, scroll_dec * delta)
		
		if scroll_vel < 0 and character.global_position.y < 0:
			return
		else:
			for object in cur_side.get_children():
				object.position.y += scroll_vel * delta * (1 if cur_side == $above else -1)
	

func set_symmetric():
	##################################################################33
	if level_needs_setup == false or true: # set to true to run some scene which isn't a complete level
		for object in cur_side.get_children():
			var symmetric_object = object.get_node("symmetry_link").obj
			if cur_side == $above:
				for child in symmetric_object.get_children():
					if child is Sprite2D:
						child.material = null
				symmetric_object.z_index = -1
				#if object.get("gravity_scale") and object.gravity_scale != 1:
					#object.gravity_scale = 1
			else:
				
				if object.get("gravity_scale") and object.gravity_scale != -1:
					pass
					#ProjectSettings.set_setting("physics/2d/default_gravity_vector", Vector2(0, 1))
			symmetric_object.global_position.y = (250 - object.global_position.y) + 250
			symmetric_object.rotation = -object.rotation
			symmetric_object.scale = Vector2(object.scale.x,-object.scale.y)
			symmetric_object.global_position.x = object.global_position.x
			if not(object is Sprite2D) and object.get_node_or_null("CollisionShape2D"):
				symmetric_object.get_node("CollisionShape2D").disabled = true
				object.get_node("CollisionShape2D").disabled = false
			# for some specific parameters of specific objects
			if object.has_method("set_up_symmetric_object"):
				object.set_up_symmetric_object()

func create_symmetric_object(object):
	var new_object = object.duplicate()
	var object_symmetric_link = symmetric_link_res.instantiate()
	object_symmetric_link.obj = new_object
	object.add_child(object_symmetric_link)
	var new_object_symmetric_link = symmetric_link_res.instantiate()
	new_object_symmetric_link.obj = object
	new_object.add_child(new_object_symmetric_link)
	return new_object


func _on_yes_input_event(_viewport, event, shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		Global.lst_checkpoint_pos = null
		get_tree().change_scene_to_file('menu.tscn')

func _on_no_input_event(_viewport, event, shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("left_click"):
		$CanvasLayer.process_mode = Node.PROCESS_MODE_DISABLED
		$CanvasLayer.visible = false
