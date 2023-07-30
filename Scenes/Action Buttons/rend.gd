extends "res://Scripts/Action Buttons/action_button.gd"

const REND = preload("res://Scenes/Action Buttons/rend_animation.tscn")

var additional_action 

func _ready():
	hover_info.description = "Deals "+str(damage)+" DMG. Costs "+str(mp_cost)+" MP. Doesn't use AP."

func MainEffect(): 
	var enemy = battle_units.enemy
	if enemy:
		CreateSlash(enemy.global_position)
		enemy.TakeDamage(damage)

		PlaySfx() 
		$SoundEffect2.play()
		PlayerStats.ap -= ap_cost 
		PlayerStats.mp -= mp_cost
		
		
func CreateSlash(pos): 
	var slash = REND.instantiate() 
	
	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(slash) 
		slash.global_position = pos
