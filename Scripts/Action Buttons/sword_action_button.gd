extends "res://Scripts/Action Buttons/action_button.gd"

const SLASH = preload("res://Scenes/slash.tscn")

func _ready():
	if PlayerStats.has_upgraded_sword:
		text = "SWORD+"
		$HoverInfo.description = "Deals "+str(PlayerStats.SLASH_DAMAGE_UPGRADED)+" dmg, Restores 2 mp"
	else:
		$HoverInfo.description = "Deals "+str(PlayerStats.SLASH_DAMAGE)+" dmg, Restores 2 mp"
		text = "SWORD"
		
	


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = PlayerStats
	var stats_container
	
	if enemy and player: 
		if pressable: 
			CreateSlash(enemy.global_position) 
			if player.has_upgraded_sword:
				enemy.TakeDamage(player.SLASH_DAMAGE_UPGRADED)
			else: 
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

