extends Node2D

var velocity = Vector2.ZERO

func _ready() -> void:
	if self.is_in_group("Hostile"):
		$Sprite2D.texture = load("res://Assets/FiendeKannonkule.png")


func _physics_process(delta):
	position += velocity * delta

func _on_timer_timeout() -> void:
	self.queue_free()
