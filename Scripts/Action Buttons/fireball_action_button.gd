extends "res://Scripts/Action Buttons/action_button.gd"

const FIREBALL = preload("res://Scenes/fireball.tscn")


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = PlayerStats
	
	if enemy and player: 
		if player.mp >= 8: 
			CreateFireball(enemy.global_position)
			sound_effect.play()
			$SoundEffect2.play()
			enemy.TakeDamage(player.FIREBALL_DAMAGE)
			player.mp -= 8
			player.ap -= 1
	

func CreateFireball(pos):
	var fireball = FIREBALL.instantiate()
	
	var battle = battle_units.battle_scene
	if battle:
		battle.add_child(fireball) 
		fireball.global_position = pos

