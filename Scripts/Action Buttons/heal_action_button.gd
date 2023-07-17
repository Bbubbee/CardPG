extends "res://Scripts/Action Buttons/action_button.gd"


func _on_pressed():
	var main = get_tree().current_scene  # Battle.  
	var player = main.find_child("PlayerStats") 
	if player != null and player.hp < player.max_hp:   
		if player.mp >= 6:
			player.hp += 5 
			player.mp -= 6
			player.ap -= 1
