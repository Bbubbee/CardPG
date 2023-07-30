extends "res://Scripts/Action Buttons/action_button.gd"

const FIREBALL = preload("res://Scenes/fireball.tscn")

func _ready():
	hover_info.description = "Deals "+str(damage)+" DMG. Costs "+str(mp_cost)+" MP."

func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = PlayerStats
	
	if enemy and player: 
		if player.mp >= mp_cost: 
			CreateFireball(enemy.global_position)
			sound_effect.play()
			$SoundEffect2.play()
			enemy.TakeDamage(damage)
			player.mp -= mp_cost
			player.ap -= ap_cost
	

func CreateFireball(pos):
	var fireball = FIREBALL.instantiate()
	
	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(fireball) 
		fireball.global_position = pos

