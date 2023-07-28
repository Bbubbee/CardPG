extends "res://Scripts/Action Buttons/action_button.gd"


const DRAIN = preload("res://Scenes/drain.tscn")

@export var heal_amount: int = 3 


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = PlayerStats
	
	if enemy and player: 
		if player.mp >= mp_cost: 
			CreateDrain(enemy.global_position)
			sound_effect.play()
			$SoundEffect2.play()
			enemy.TakeDamage(damage)
			player.mp -= mp_cost
			player.hp += heal_amount
			player.ap -= ap_cost
	
func CreateDrain(pos):
	var drain = DRAIN.instantiate()

	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(drain) 
		drain.global_position = pos


