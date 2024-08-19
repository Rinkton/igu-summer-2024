extends CharacterBody2D

var gravity = 30
var direction := Vector2(0,0)

func _process(_delta):
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed('w') and is_on_floor():
		velocity.y = -500
	var horz = Input.get_axis('a','d')
	velocity.x = 100 * horz
	velocity.x = 300 * horz
	move_and_slide()
