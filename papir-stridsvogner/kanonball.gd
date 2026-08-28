extends Node2D

const speed = 500.0

var velocity = Vector2.ZERO

func set_retning(direction: Vector2):
	velocity = direction * speed


func _physics_process(delta):
	position += velocity * delta


func _on_timer_timeout() -> void:
	self.queue_free()
