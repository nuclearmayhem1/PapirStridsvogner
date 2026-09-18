extends ProgressBar
# Vi kan bestemme HP-en til spilleren her
var player_hp = 5

# Ready-koden kjøres ved spill-start
func _ready() -> void:
	# Verdien på HP baren starter ifra spilleren sin HP verdi når spillet starter
	value = player_hp
	# Og maks-verdien på HP-baren er også basert 
	max_value = player_hp

func _process(delta: float) -> void:
	# Så snart det er ingenting i spillet som er i "hostile" gruppen:
	if get_tree().get_node_count_in_group("hostile") == 0:
		# Vis vin-teksten
		$VinTekst.visible = true
		# Stopp spillet
		get_tree().paused = true

# Når spilleren sier ifra at den er skutt:
func _on_spiller_player_damage() -> void:
	# Trekk 1 ifra spilleren sin HP
	player_hp -= 1
	# Oppdater HP-baren sin verdi også, siden de er ikke samme boks
	self.value = player_hp
	# Hvis spilleren sin HP treffer 0:
	if player_hp == 0:
		# Vis tap-teksten
		$TapTekst.visible = true
		# Stopp spillet
		get_tree().paused = true
