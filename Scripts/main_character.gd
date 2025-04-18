extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -700.0
const MIN_JUMP_HEIGHT = 0.5

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.2

	# Verify if collision with obstacle
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if collision.get_collider().name != "GroundBody":
			#print("Collider collided with:", collision.get_collider().name)
			get_node("../../GameOver").game_over()
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# velocity.x = SPEED
	move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept"):
		if velocity.y < 0.0:
			velocity.y *= MIN_JUMP_HEIGHT
