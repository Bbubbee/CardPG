extends "res://Scripts/Action Buttons/action_button.gd"

const SLASH = preload("res://Scenes/slash.tscn")


func _on_pressed(): 
	var main = get_tree().current_scene  # Battle. 
	var enemy = main.find_child("Enemy") 
	var player = main.find_child("PlayerStats") 
	
	if enemy != null and player != null: 
		CreateSlash(enemy.global_position) 
		player.mp += 2
		player.ap -= 1  
		enemy.TakeDamage(player.damage)
		

func CreateSlash(pos): 
	var slash = SLASH.instantiate() 
	var main = get_tree().current_scene
	main.add_child(slash) 
	slash.global_position = pos
	
