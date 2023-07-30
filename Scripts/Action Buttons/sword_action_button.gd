extends "res://Scripts/Action Buttons/action_button.gd"

const SLASH = preload("res://Scenes/slash.tscn")

@onready var bonus_sfx = $BonusSfx

# OVERRIDDEN
func _ready():
	if PlayerStats.has_upgraded_sword:
		text = "SWORD+"
		$HoverInfo.description = "Deals "+str(PlayerStats.SLASH_DAMAGE_UPGRADED)+" DMG. Restores 3 MP."
	else:
		$HoverInfo.description = "Deals "+str(damage)+" DMG. Restores 2 MP."
		text = "SWORD"
	
# OVERRIDDEN	
func MainEffect(): 
	var enemy = battle_units.enemy
	var player = PlayerStats

	if enemy and player: 
		CreateSlash(enemy.global_position) 
		if player.has_upgraded_sword:
			enemy.TakeDamage(player.SLASH_DAMAGE_UPGRADED)
			player.mp += 3
		else: 
			enemy.TakeDamage(damage)
			player.mp += 2
		
		player.ap -= 1  
		PlaySfx() 
		

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

