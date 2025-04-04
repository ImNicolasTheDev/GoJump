extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 2

	move_local_x(-5)
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
