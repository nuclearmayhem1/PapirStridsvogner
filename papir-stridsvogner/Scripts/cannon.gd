extends Sprite2D

@onready var point_direction = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Input.is_action_just_pressed("shoot_up"):
		point_direction = Vector2.UP
	if Input.is_action_just_pressed("shoot_left"):
		point_direction = Vector2.LEFT
	if Input.is_action_just_pressed("shoot_right"):
		point_direction = Vector2.RIGHT
	if Input.is_action_just_pressed("shoot_down"):
		point_direction = Vector2.DOWN
		
	self.global_rotation = point_direction.angle() + deg_to_rad(90.0)
	pass
