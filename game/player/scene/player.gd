extends CharacterBody2D



const SPEED = 500.0
const JUMP_VELOCITY = -1000.0
const FALL_THRESHOLD = 300.0 
const MAX_JUMPS = 2

var jump_count = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
		
	if jump_count < MAX_JUMPS and Input.is_action_just_pressed("up"):
		if is_on_floor() or velocity.y < FALL_THRESHOLD:
			velocity.y = JUMP_VELOCITY
			jump_count += 1 
		
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
