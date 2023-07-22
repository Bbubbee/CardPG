extends Button

var stats_changed_label = preload("res://Scenes/damage_taken_label.tscn")
var battle_units = preload("res://Assets/Resources/BattleUnits.tres")
var pressable = true

func _on_pressed():
	pass


func _on_cooldown_timeout():
	pressable = true
