extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	
	var movement_direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		movement_direction += Vector2.UP
	if Input.is_action_pressed("move_left"):
		movement_direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		movement_direction += Vector2.RIGHT
	if Input.is_action_pressed("move_down"):
		movement_direction += Vector2.DOWN
	
	velocity = movement_direction * SPEED
	#if you let go of movement keys, the belts won't snap to facing right when the tank stops moving
	if velocity != Vector2.ZERO:
		self.global_rotation = velocity.angle()

	move_and_slide()
