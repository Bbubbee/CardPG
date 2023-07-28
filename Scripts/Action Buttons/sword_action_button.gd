extends "res://Scripts/Action Buttons/action_button.gd"

const SLASH = preload("res://Scenes/slash.tscn")

@onready var bonus_sfx = $BonusSfx

# OVERRIDDEN
func _ready():
	if PlayerStats.has_upgraded_sword:
		text = "SWORD+"
		$HoverInfo.description = "Deals "+str(PlayerStats.SLASH_DAMAGE_UPGRADED)+" dmg, Restores 2 mp"
	else:
		$HoverInfo.description = "Deals "+str(damage)+" dmg, Restores 2 mp"
		text = "SWORD"
	
# OVERRIDDEN	
func MainEffect(): 
	var enemy = battle_units.enemy
	var player = PlayerStats

	if enemy and player: 
		CreateSlash(enemy.global_position) 
		if player.has_upgraded_sword:
			enemy.TakeDamage(player.SLASH_DAMAGE_UPGRADED)
		else: 
			enemy.TakeDamage(damage)
		player.mp += 2
		player.ap -= 1  
		

# OVERRIDDEN		
func PlaySfx():
	randomize()
	var r = randi_range(0, 1)
	if r == 1: 
		sound_effect.play()
	else: 
		bonus_sfx.play()
		
func CreateSlash(pos): 
	var slash = SLASH.instantiate() 
	
	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(slash) 
		slash.global_position = pos

