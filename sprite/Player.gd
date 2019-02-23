extends KinematicBody2D

export var SPEED = 200
export var JUMP_POWER = -250
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()



func _physics_process(delta):
	
	if Input.is_action_pressed('ui_right'):
		velocity.x = SPEED
	elif Input.is_action_pressed('ui_left'):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed('ui_up'):
		velocity.y = JUMP_POWER + ((position.y / 15) + GRAVITY)
		
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)