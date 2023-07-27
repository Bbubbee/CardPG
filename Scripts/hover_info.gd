extends Control

@export_multiline var description: String = ""
var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

func _on_mouse_entered():
	var textbox = battle_units.battle_log
	if textbox: 
		textbox.is_hovering = true
		textbox.text = description

func _on_mouse_exited():
	var textbox = battle_units.battle_log
	if textbox: 
		textbox.is_hovering = false
		textbox.text = ""
