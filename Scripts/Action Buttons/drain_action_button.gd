extends "res://Scripts/Action Buttons/action_button.gd"


const DRAIN = preload("res://Scenes/drain.tscn")


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
			player.hp += damage
			player.ap -= ap_cost
	
func CreateDrain(pos):
	var drain = DRAIN.instantiate()

	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(drain) 
		drain.global_position = pos


