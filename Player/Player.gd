extends KinematicBody2D

const MAX_SPEED = 180
const ACCELERATION = 1080
const FRICTION = 720


var velocity = Vector2.ZERO


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		# two different ways to do movement, but one is smoother and
		# the other is a bit blockier - could use one for ground movement
		# vs other for flying
		#velocity += input_vector * ACCELERATION * delta
		#velocity = velocity.clamped(MAX_SPEED)
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION*delta)
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
	
	velocity = move_and_slide(velocity)
