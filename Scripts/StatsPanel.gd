extends Panel

@onready var hp_label = $StatsContainer/HP
@onready var ap_label = $StatsContainer/AP
@onready var mp_label = $StatsContainer/MP




func _on_player_stats_ap_changed(val):
	ap_label.text = "AP\n"+str(val) 


func _on_player_stats_hp_changed(val):
	hp_label.text = "HP\n"+str(val)  


func _on_player_stats_mp_changed(val):
	mp_label.text = "MP\n"+str(val) 
