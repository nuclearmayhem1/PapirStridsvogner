extends ProgressBar

var player_hp = 5

func _ready() -> void:
	value = player_hp

func _process(delta: float) -> void:
	if get_tree().get_node_count_in_group("hostile") == 0:
		$VinTekst.visible = true
		get_tree().paused = true

func _on_spiller_player_damage() -> void:
	player_hp -= 1
	self.value = player_hp
	if player_hp == 0:
		$TapTekst.visible = true
		get_tree().paused = true
