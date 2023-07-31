extends "res://Scripts/Action Buttons/action_button.gd"

var BLIGHT = preload("res://Scenes/Action Buttons/blight_animation.tscn")

@export var heal_amount: int = 1

func _ready():
	hover_info.description = "Deals "+str(damage)+" DMG. Heals "+str(heal_amount)+" HP. Costs "+str(mp_cost)+" MP."
	
# OVERRIDDEN
func MainEffect(): 
	var enemy = battle_units.enemy
	if enemy:
		enemy.TakeDamage(damage)
		PlayAnimation(enemy.global_position) 		

		PlaySfx() 
		PlayerStats.hp += heal_amount
		PlayerStats.ap -= ap_cost 
		PlayerStats.mp -= mp_cost

func PlayAnimation(pos): 
	var blight = BLIGHT.instantiate()
	
	var main = battle_units.battle_scene
	main.add_child(blight) 
	blight.global_position = pos 
	
