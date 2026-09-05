extends Sprite2D

var firing_speed = 400
var kanonkule = preload("res://Scenes/kanonkule.tscn")
@onready var reload_timer: Timer = $"../Timer"



func shoot():
	# Forbered en ny kanonkule
	var kanonkule_instance = kanonkule.instantiate() 
	# Marker at kanonkulen tilhører fienden.
	kanonkule_instance.add_to_group("Hostile")
	# Flytt den til enden av kanonen
	kanonkule_instance.transform.origin = self.global_transform.origin + (Vector2.from_angle(self.global_rotation - deg_to_rad(90)) * 180)
	# Gi den fart i kanonen sin retning
	kanonkule_instance.velocity =  Vector2.from_angle(self.global_rotation - deg_to_rad(90)) * firing_speed
	# Plasser den i verden som "søsken" til spilleren, slik at den ikke henger etter spilleren
	get_parent().add_sibling(kanonkule_instance)


func _on_timer_timeout() -> void:
	# Skyt kanonkule
	shoot()
	# Lag ny verdi for hvor lenge det tar for banditten å reload.
	# Prøv å endre på tallene og se hvordan de endrer på seg.
	var reload_time = randf_range(1.0,2.0)
	# Start nedtellingen med den ny verdien vår
	reload_timer.start(reload_time)
