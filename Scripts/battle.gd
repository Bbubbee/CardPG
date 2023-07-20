extends Node

@onready var player_battle_action_buttons = $UI/BattleActionButtons
@onready var animation_player = $AnimationPlayer
@onready var next_room_button = $UI/CenterContainer/NextRoomButton
@onready var enemy_position = $EnemyPosition

@export var enemies : Array[PackedScene] 




var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

func _ready():
	CreateNewEnemy()
	CreateActionButtons()
	StartPlayerTurn()
	
		
func StartPlayerTurn(): 
	next_room_button.hide() 
	player_battle_action_buttons.show()
	
	PlayerStats.ap = PlayerStats.max_ap
	await PlayerStats.end_turn
	StartEnemyTurn()

func StartEnemyTurn():
	player_battle_action_buttons.hide()
	
	var enemy = battle_units.enemy
	if enemy and not enemy.is_queued_for_deletion():
		enemy.StartTurn()
		await enemy.end_turn  
	StartPlayerTurn()


func _on_next_room_button_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")
	
	
func _on_enemy_died(): 
	next_room_button.show()
	player_battle_action_buttons.hide() 
	
func CreateNewEnemy(): 
	enemies.shuffle()
	var enemy = enemies[0].instantiate()
	battle_units.enemy = enemy
	enemy_position.add_child(enemy)
	enemy.died.connect(_on_enemy_died)

func CreateActionButtons(): 
	for action_button in PlayerStats.action_buttons: 
		player_battle_action_buttons.add_child(action_button)
	
	
	
	

	
