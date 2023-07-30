extends "res://Scripts/Action Buttons/action_button.gd"

const CRUX = preload("res://Scenes/Action Buttons/crux_animation.tscn")

@export var self_damage: int = 1

func _ready():
	hover_info.description = "Deals "+str(damage)+" DMG. Costs "+str(self_damage)+" HP."

func MainEffect(): 
	var enemy = battle_units.enemy
	if enemy:
		enemy.TakeDamage(damage)
		CreateAnimation(enemy.global_position)
		PlaySfx() 
		PlayerStats.ap -= ap_cost 
		PlayerStats.mp -= mp_cost
		PlayerStats.hp = max(1, PlayerStats.hp-self_damage) 

func CreateAnimation(pos):
	var crux = CRUX.instantiate() 
	
	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(crux) 
		crux.global_position = pos
 
	
