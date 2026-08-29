extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	#Input, generates a float from -1.0 to 1.0 for up and down directions
	var x_direction := Input.get_axis("move_left", "move_right")
	var y_direction := Input.get_axis("move_up", "move_down")
	
	
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	#if you let go of movement keys, the belts won't snap to facing right when the tank stops moving
	if (x_direction == 0) and (y_direction == 0):
		pass
	else: 
		self.global_rotation = velocity.angle()

	move_and_slide()
