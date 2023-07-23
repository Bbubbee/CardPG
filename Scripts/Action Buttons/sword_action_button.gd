extends "res://Scripts/Action Buttons/action_button.gd"

const SLASH = preload("res://Scenes/slash.tscn")


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = PlayerStats
	var stats_container
	
	if enemy and player: 
		if pressable: 
			CreateSlash(enemy.global_position) 
			enemy.TakeDamage(player.SLASH_DAMAGE)
			player.mp += 2
			player.ap -= 1  
		
			# Start action button cool down.
			pressable = false
			$Cooldown.start()

		
func CreateSlash(pos): 
	var slash = SLASH.instantiate() 
	
	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(slash) 
		slash.global_position = pos

