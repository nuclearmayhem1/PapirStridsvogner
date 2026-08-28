extends Sprite2D

var point_direction = Vector2.UP
var kanonball = load("res://kanonball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Input.is_action_just_pressed("shoot_up"):
		point_direction = Vector2.UP
		shoot()
	if Input.is_action_just_pressed("shoot_left"):
		point_direction = Vector2.LEFT
		shoot()
	if Input.is_action_just_pressed("shoot_right"):
		point_direction = Vector2.RIGHT
		shoot()
	if Input.is_action_just_pressed("shoot_down"):
		point_direction = Vector2.DOWN
		shoot()
		
	self.global_rotation = point_direction.angle() + deg_to_rad(90.0)
	pass

func shoot():
	var kanonball_instance = kanonball.instantiate()
	kanonball_instance.set_retning(point_direction)
	kanonball_instance.transform.origin = self.global_transform.origin
	kanonball_instance.velocity += get_parent().velocity / 5
	get_parent().add_sibling(kanonball_instance)
	
	
