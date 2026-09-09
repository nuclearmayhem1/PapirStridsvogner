extends CharacterBody2D

var spiller: Node2D
var speed = 50
var hp = 3

func _ready():
	var spiller_liste = get_tree().get_nodes_in_group("spiller")
	assert(spiller_liste.size() == 1)
	
	spiller = spiller_liste[0]


func _physics_process(_delta: float) -> void:
	#hvis spilleren ikke er tilgjengelig stopper det koden å fortsett
	if spiller == null: 
		return
	
	#håndterer bevegelse (bestemmer retning)
	var direction: Vector2 = (spiller.global_position - global_position).normalized()
	velocity = direction * speed #retning + fart = hastighet
	self.global_rotation = velocity.angle()
	move_and_slide()

func take_damage():
	hp -= 1
	if hp == 0:
		queue_free()
	
