extends Node

@onready var enemy = $Enemy
@onready var player_battle_action_buttons = $UI/BattleActionButtons
@onready var player = $PlayerStats


func _ready():
	StartPlayerTurn()

func StartPlayerTurn(): 
	player_battle_action_buttons.show()
	player.ap = player.max_ap
	await player.end_turn
	StartEnemyTurn()

func StartEnemyTurn():
	player_battle_action_buttons.hide()
	if enemy != null:
		enemy.Attack(player)
		await enemy.end_turn  
	StartPlayerTurn()

func _on_sword_button_pressed():
	if enemy != null:
		player.ap -= 1
		enemy.TakeDamage(4) 
		
func _on_enemy_died():
	player_battle_action_buttons.hide()
	enemy = null 
