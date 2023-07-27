extends "res://Scripts/Action Buttons/action_button.gd"


func _on_pressed():
	var player = PlayerStats
	if player:   
		sound_effect.play()
		player.ap -= 1 
		player.mp += 6
 
