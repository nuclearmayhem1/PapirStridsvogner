extends Node2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	position += velocity * delta

func _on_timer_timeout() -> void:
	self.queue_free()
