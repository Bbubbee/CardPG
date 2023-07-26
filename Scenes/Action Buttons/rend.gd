extends "res://Scripts/Action Buttons/action_button.gd"


func _on_pressed():
	var player = PlayerStats
	var enemy = battle_units.enemy
	
	if player and enemy:
		PerformAction(damage, enemy)
