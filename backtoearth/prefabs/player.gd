extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -200
const COYOTE_TIME = .08

var ableToJump = false

var isJumping = false

var cTimer
var jumpTimer

func _on_ready() -> void:
	cTimer = $CoyoteTimer
	jumpTimer = $VarJumpTimer


func _physics_process(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	ableToJump = true
	# print(jumpTimer.time_left)
	# Handle jump.
	playerJump()
	
	# debug
	$"../Label".text = "Fuel: " + str(round((jumpTimer.time_left / jumpTimer.wait_time) * 100)) + "/100"
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# Unused
func coyoteTime():
	# Coyote Time
	if is_on_floor():
		cTimer.stop()
	elif cTimer.is_stopped():
		cTimer.start()
	
	if cTimer.is_stopped() or cTimer.time_left > cTimer.wait_time - COYOTE_TIME:
		# if timer is running
		ableToJump = true
	else:
		ableToJump = false

func playerJump():
	if is_on_floor():
		jumpTimer.start()
		jumpTimer.paused = true
	
	if Input.is_action_just_pressed("Up") and ableToJump:
		if is_on_floor():
			jumpTimer.start()
			jumpTimer.paused = false
		else:
			jumpTimer.paused = false
		
		isJumping = true
	
	if Input.is_action_pressed("Up") and isJumping:
		if not jumpTimer.is_stopped():
			velocity.y = JUMP_VELOCITY
		else:
			isJumping = false
	if Input.is_action_just_released("Up"):
		isJumping = false
		jumpTimer.paused = true

func _on_coyote_timer_timeout() -> void:
	cTimer.stop()

func _on_var_jump_timer_timeout() -> void:
	jumpTimer.stop()
	isJumping = false
