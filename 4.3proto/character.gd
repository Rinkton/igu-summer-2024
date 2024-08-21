extends CharacterBody2D

var gravity = 30
var direction := Vector2(0,0)
var push_force = 20.0
var axis
var is_above = true

func _ready():
	axis = get_tree().current_scene.get_node("axis")

func _process(_delta):
	# after calling move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	check_is_above()
	
	if Input.is_action_just_pressed('w'):
		$jump_buffer_timer.start()
	if is_on_floor():
		$coyote_timer.start()
	
	if not $jump_buffer_timer.is_stopped() and not $coyote_timer.is_stopped():
		velocity.y = -500
		$jump_buffer_timer.stop()
		$coyote_timer.stop()
	var horz = Input.get_axis('a','d')
	velocity.x = 100 * horz
	velocity.x = 300 * horz
	
	if velocity.x > 10:
		for anim in [$idle, $run, $jump]:
			anim.flip_h = false
	elif velocity.x < -10:
		for anim in [$idle, $run, $jump]:
			anim.flip_h = true
	
	animate()
	
	move_and_slide()

func check_is_above():
	is_above = global_position.y < axis.global_position.y - 10

func animate():
	if velocity == Vector2(0,0):
		play_anim($idle)
	else:
		if velocity.y != 0:
			play_anim($jump)
		else:
			play_anim($run)

func play_anim(what):
	for anim in [$idle, $run, $jump]:
		if anim == what:
			anim.visible = true
			anim.play()
			if anim == $run:
				$RunAnimationPlayer.play("running")
			else:
				$RunAnimationPlayer.play("not running")
		else:
			anim.visible = false
			anim.stop()
