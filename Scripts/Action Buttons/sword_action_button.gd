extends "res://Scripts/Action Buttons/action_button.gd"

const SLASH = preload("res://Scenes/slash.tscn")


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = battle_units.player 
	
	if enemy and player: 
		if pressable: 
			CreateSlash(enemy.global_position) 
			enemy.TakeDamage(player.damage)
			player.mp += 2
			player.ap -= 1  
		
			# Start action button cool down.
			pressable = false
			$Cooldown.start()
		
		
		
		

func CreateSlash(pos): 
	var slash = SLASH.instantiate() 
	var main = get_tree().current_scene
	main.add_child(slash) 
	slash.global_position = pos

