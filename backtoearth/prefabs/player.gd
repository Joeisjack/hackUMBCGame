extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400

var ableToJump = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		coyoteTimeStart()

	# Handle jump.
	if Input.is_action_just_pressed("Up") and (is_on_floor() or $Timer.time_left > 0):
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func coyoteTimeStart():
	print("e");
	$Timer.start()

func _on_timer_timeout() -> void:
	$Timer.stop()
