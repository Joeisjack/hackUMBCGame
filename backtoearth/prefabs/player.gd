extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400
const COYOTE_TIME = 0.08

var ableToJump = false

func _physics_process(delta: float) -> void:
	# Coyote Time
	print($Timer.time_left)
	if is_on_floor():
		$Timer.stop()
	elif $Timer.is_stopped():
		$Timer.start()
	
	if $Timer.is_stopped() or $Timer.time_left > $Timer.wait_time - COYOTE_TIME:
		# if timer is running
		ableToJump = true
	else:
		ableToJump = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.get_axis("Up", "Down") and ableToJump:
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_timer_timeout() -> void:
	$Timer.stop()
