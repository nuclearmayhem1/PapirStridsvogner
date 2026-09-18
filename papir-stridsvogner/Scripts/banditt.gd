extends CharacterBody2D

# Lag en boks for spilleren
var spiller: Node2D
# Vi trenger også en boks for HP
var hp = 3
# I motsetning til HP så skal ikke hastighet endres, så denne er en konstant verdi
const speed = 50

func _ready():
	# Søk i scenen for noder som er i gruppen "spiller"
	var spiller_liste = get_tree().get_nodes_in_group("spiller")
	# Det skal være nøyaktig en spiller til en hver tid.
	# Om det er 0, eller mer enn 1, send error
	assert(spiller_liste.size() == 1)
	# Legg spilleren vi fant i søket i spiller-boksen
	spiller = spiller_liste[0]

func _physics_process(_delta: float) -> void:
	# Hvis spilleren ikke er tilgjengelig stopper det koden
	if spiller == null: 
		return
	
	# Håndterer bevegelse (bestemmer retning)
	var direction: Vector2 = (spiller.global_position - global_position).normalized()
	# Retning * fart = hastighet
	velocity = direction * speed
	# Roter banditten i bevegelsesrettningen  
	self.global_rotation = velocity.angle() 
	move_and_slide()

func take_damage():
	# Trekk fra 1 hp 
	hp -= 1
	# Hvis HP er nå null, slett banditten
	if hp == 0:
		queue_free()
	
