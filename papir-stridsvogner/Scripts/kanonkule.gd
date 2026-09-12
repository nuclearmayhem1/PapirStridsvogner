extends Node2D

var velocity = Vector2.ZERO

var poof = preload("res://Scenes/teknisk/poof.tscn")

func _ready() -> void:
	if self.is_in_group("hostile"):
		$Sprite2D.texture = load("res://Assets/FiendeKannonkule.png")

func _physics_process(delta):
	position += velocity * delta

func _on_timer_timeout() -> void:
	self.queue_free()

func _on_collision_shape_2d_body_entered(body: Node2D) -> void:
	if !body.has_method("take_damage"):
		self.queue_free()
		spawn_poof()
		return
	if self.is_in_group("hostile") and body.is_in_group("spiller"):
		body.take_damage()
		self.queue_free()
		spawn_poof()
	else:
		if !self.is_in_group("hostile") and body.is_in_group("hostile"):
			body.take_damage()
			self.queue_free()
			spawn_poof()

func take_damage():
	self.queue_free()

func spawn_poof():
	var poof_instance = poof.instantiate()
	poof_instance.transform.origin = self.transform.origin
	add_sibling(poof_instance)
