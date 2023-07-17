extends Node

@onready var player_battle_action_buttons = $UI/BattleActionButtons

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

func _ready():
	StartPlayerTurn()

func StartPlayerTurn(): 
	player_battle_action_buttons.show()
	
	var player = battle_units.player
	player.ap = player.max_ap
	await player.end_turn
	StartEnemyTurn()

func StartEnemyTurn():
	player_battle_action_buttons.hide()
	
	var enemy = battle_units.enemy
	if enemy:
		enemy.Attack()
		await enemy.end_turn  
	StartPlayerTurn()

func _on_enemy_died():
	player_battle_action_buttons.hide()
	var player = battle_units.player
	player.emit_signal("end_turn") 

