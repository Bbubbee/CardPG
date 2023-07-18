extends Node

@onready var player_battle_action_buttons = $UI/BattleActionButtons
@onready var animation_player = $AnimationPlayer
@onready var next_room_button = $UI/CenterContainer/NextRoomButton
@onready var enemy_position = $EnemyPosition

@export var enemies : Array[PackedScene] 


var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

func _ready():
	StartPlayerTurn()
	var enemy = battle_units.enemy
	if enemy: 
		enemy.died.connect(_on_enemy_died)
		

func StartPlayerTurn(): 
	next_room_button.hide() 
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


func _on_next_room_button_pressed():
	next_room_button.hide() 
	animation_player.play("FadeToNewRoom")
	await animation_player.animation_finished	
	player_battle_action_buttons.show()
	battle_units.player.ap = battle_units.player.max_ap
	battle_units.player.mp = battle_units.player.max_mp
	
	CreateNewEnemy()
	
func _on_enemy_died(): 
	battle_units.enemy = null
	next_room_button.show()
	player_battle_action_buttons.hide() 
	
func CreateNewEnemy(): 
	enemies.shuffle()
	var enemy = enemies[0].instantiate()
	battle_units.enemy = enemy
	enemy_position.add_child(enemy)
	enemy.died.connect(_on_enemy_died)
	
	
