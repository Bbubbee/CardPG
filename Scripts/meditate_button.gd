extends "res://Scripts/Action Buttons/action_button.gd"


func _on_pressed():
	var player = battle_units.player
	if player:   
		player.ap -= 1 
		player.mp += 6
 
