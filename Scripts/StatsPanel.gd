extends Panel

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")
var stats_changed_label = preload("res://Scenes/damage_taken_label.tscn")

@onready var hp_label = $StatsContainer/HP
@onready var ap_label = $StatsContainer/AP
@onready var mp_label = $StatsContainer/MP


func _ready():
	hp_label.text = "HP\n"+str(PlayerStats.hp)
	ap_label.text = "AP\n"+str(PlayerStats.ap)
	mp_label.text = "MP\n"+str(PlayerStats.mp)
	
	PlayerStats.hp_changed.connect(_on_player_stats_hp_changed)
	PlayerStats.ap_changed.connect(_on_player_stats_ap_changed)
	PlayerStats.mp_changed.connect(_on_player_stats_mp_changed)


func _on_player_stats_ap_changed(val):
	var change = int(ap_label.text) - val
	change *= -1
	
	ap_label.text = "AP\n"+str(val)
	
	var x = stats_changed_label.instantiate()
	ap_label.add_child(x)
	if change > 0: 
		x.ShowStatChanged("\n+"+str(change))
	else:
		x.ShowStatChanged("\n"+str(change))

	


func _on_player_stats_hp_changed(val):
	var change = int(hp_label.text) - val
	change *= -1
	
	hp_label.text = "AP\n"+str(val)
	
	var x = stats_changed_label.instantiate()
	hp_label.add_child(x)
	if change > 0: 
		x.ShowStatIncreased("\n+"+str(change))
	else:
		x.ShowDamageTaken("\n"+str(change))


func _on_player_stats_mp_changed(val):
	var change = int(mp_label.text) - val
	change *= -1
	
	mp_label.text = "AP\n"+str(val)
	
	var x = stats_changed_label.instantiate()
	mp_label.add_child(x)
	if change > 0: 
		x.ShowStatChanged("\n+"+str(change))
	else:
		x.ShowStatChanged("\n"+str(change))
