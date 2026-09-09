# Godot har mange nyttige funkjsoner.
# Når en skriptfil startes med "extends _____"
# Så låner vi kode som har noen ferdigskrevet funksjoner
extends CharacterBody2D

# Linjer som starter med en "#" er kommentar
# Godot ignorerer alle kommentarlinjer
# De brukes for å notere ting i selve koden, for å gjøre det lettere å lese

# Denne er en "const", eller konstant variabel. 
# Den kan ikke endres på når spillet er i gang
const SPEED = 300.0

func _physics_process(_delta: float) -> void:
	# Lag ny variabel for retning
	var movement_direction = Vector2.ZERO
	
	# Denne brukes overalt i programmering. Hvis X, utfør Y
	if Input.is_action_pressed("move_up"):
		movement_direction += Vector2.UP
	if Input.is_action_pressed("move_left"):
		movement_direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		movement_direction += Vector2.RIGHT
	if Input.is_action_pressed("move_down"):
		movement_direction += Vector2.DOWN
	
	velocity = movement_direction * SPEED
	
	# Hvis du slipper tastene
	# Så holder stridsvognen seg til samme retning før du slapp
	if velocity != Vector2.ZERO:
		self.global_rotation = velocity.angle()

	move_and_slide()

signal player_damage
func take_damage():
	emit_signal("player_damage")
