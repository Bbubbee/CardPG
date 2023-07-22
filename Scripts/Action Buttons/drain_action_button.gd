extends "res://Scripts/Action Buttons/action_button.gd"


const FIREBALL = preload("res://Scenes/fireball.tscn")


func _on_pressed(): 
	var enemy = battle_units.enemy
	var player = PlayerStats
	
	if enemy and player: 
		if player.mp >= 3: 
			CreateDrain(enemy.global_position)
			enemy.TakeDamage(3)
			player.mp -= 3
			player.hp += 3
			player.ap -= 1
	
func CreateDrain(pos):
	var fireball = FIREBALL.instantiate()
	var main = get_tree().current_scene
	main.add_child(fireball)  
	fireball.global_position = pos

