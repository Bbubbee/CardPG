extends "res://Scripts/Action Buttons/action_button.gd"

const FIREBALL = preload("res://Scenes/fireball.tscn")


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = battle_units.player
	
	if enemy and player: 
		if player.mp >= 8: 
			CreateFireball(enemy.global_position)
			enemy.TakeDamage(player.fireball_damage)
			player.mp -= 8
			player.ap -= 1
	
func CreateFireball(pos):
	var fireball = FIREBALL.instantiate()
	var main = get_tree().current_scene
	main.add_child(fireball)  
	fireball.global_position = pos

