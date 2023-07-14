extends Node

@onready var enemy = $Enemy
@onready var sword_button = $UI/BattleActionButtons/SwordButton

func _on_sword_button_pressed():
	if enemy != null:
		enemy.hp -= 4
		
func _on_enemy_died():
	sword_button.disabled = true
	enemy = null 
