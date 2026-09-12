extends Sprite2D

var firing_speed = 500
var firing_direction = Vector2.UP
var kanonkule = preload("res://Scenes/teknisk/kanonkule.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("shoot_up"):
		firing_direction = Vector2.UP
		shoot()
	if Input.is_action_just_pressed("shoot_left"):
		firing_direction = Vector2.LEFT
		shoot()
	if Input.is_action_just_pressed("shoot_right"):
		firing_direction = Vector2.RIGHT
		shoot()
	if Input.is_action_just_pressed("shoot_down"):
		firing_direction = Vector2.DOWN
		shoot()
		
	self.global_rotation = firing_direction.angle() + deg_to_rad(90.0)


func shoot():
	# Forbered en ny kanonkule
	var kanonkule_instance = kanonkule.instantiate() 
	# Flytt den til enden av kanonen
	kanonkule_instance.transform.origin = self.global_transform.origin + (firing_direction * 180)
	# Gi den fart i kanonen sin retning
	kanonkule_instance.velocity = firing_direction * firing_speed
	# Plasser den i verden som "søsken" til spilleren, slik at den ikke henger etter spilleren
	get_parent().add_sibling(kanonkule_instance)
