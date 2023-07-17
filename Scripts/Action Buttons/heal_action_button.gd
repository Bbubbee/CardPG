extends "res://Scripts/Action Buttons/action_button.gd"


func _on_pressed():
	var player = battle_units.player
	if player and player.hp < player.max_hp:   
		if player.mp >= 6:
			player.hp += 5 
			player.mp -= 6
			player.ap -= 1
