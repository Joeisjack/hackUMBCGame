extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -200
const COYOTE_TIME = .08

var ableToJump = false

var isJumping = false

@onready var cTimer: Timer = $CoyoteTimer

@onready var jumpTimer: Timer = $VarJumpTimer

@onready var playerSprite: AnimatedSprite2D = $AnimatedSprite2D

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
	
	# Get Input direction (-1, 0, 1)
	var direction := Input.get_axis("Left", "Right")
	
	# Flip the sprite
	if direction > 0:
		playerSprite.flip_h = false
	elif direction < 0:
		playerSprite.flip_h = true
	
	
	if velocity.y > 0:
		playerSprite.play("falling")
	elif not jumpTimer.paused:
		playerSprite.play("thrusting")
	elif direction == 0:
		playerSprite.play("idle")
	else:
		playerSprite.play("moving")
	
	
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
