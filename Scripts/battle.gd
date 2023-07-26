extends Node

@onready var player_battle_action_buttons = $UI/BattleActionButtons
@onready var animation_player = $AnimationPlayer
@onready var next_room_button = $UI/CenterContainer/NextRoomButton
@onready var enemy_position = $EnemyPosition

var enemies : Array[PackedScene] 

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")



func _ready():
	print(PlayerStats.current_level)
	battle_units.battle_scene = self
	ReadyShield()
	SelectEnemies() 
	CreateNewEnemy()
	StartPlayerTurn()
	
# Chooses the enemies to face based on the current level. 
func SelectEnemies():
	var level = PlayerStats.current_level
	
#	ction_buttons.append(load("res://Scenes/sword_action_button.tscn")) 

	if level == 2: 
		enemies.append(load("res://Scenes/Enemies/golem.tscn")) 
		if PlayerStats.skele_route: 
			enemies.append(load("res://Scenes/Enemies/skeleton.tscn"))
		else: 
			enemies.append(load("res://Scenes/Enemies/spider.tscn"))
	elif level == 3:
		enemies.append(load("res://Scenes/Enemies/cultist_mage.tscn"))
		enemies.append(load("res://Scenes/Enemies/cultist_melee.tscn"))
	else:  
#		enemies.append(load("res://Scenes/Enemies/skeleton.tscn")) 
#		enemies.append(load("res://Scenes/Enemies/golem.tscn")) 
#		enemies.append(load("res://Scenes/Enemies/spider.tscn"))
#		enemies.append(load("res://Scenes/Enemies/cultist_mage.tscn"))
#		enemies.append(load("res://Scenes/Enemies/cultist_melee.tscn"))
		enemies.append(load("res://Scenes/Enemies/grim_beast.tscn"))
#		enemies.append(load("res://Scenes/Enemies/slime.tscn"))
#		enemies.append(load("res://Scenes/Enemies/rat.tscn"))
		
func CreateNewEnemy(): 
	enemies.shuffle()
	var enemy = enemies[0].instantiate()
	battle_units.enemy = enemy
	enemy_position.add_child(enemy)
	enemy.died.connect(_on_enemy_died)
	
func ReadyShield():
	if PlayerStats.has_shield: 
		$Shield.show() 


func _exit_tree():
	PlayerStats.ap = PlayerStats.max_ap
	PlayerStats.intersection += 1
	battle_units.battle_scene = null
	
		
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
	next_room_button.disabled = true 
	
	match PlayerStats.intersection: 
		3:
			SceneTransition.ChangeScene("res://Scenes/Intersections/first_intersection.tscn")
		6: 
			SceneTransition.ChangeScene("res://Scenes/level_2.tscn")
			# Goes to second intersection after. 
		9:
			SceneTransition.ChangeScene("res://Scenes/Intersections/third_intersection.tscn")
		12:
			SceneTransition.ChangeScene("res://Scenes/level_3.tscn")	
			# Goes to fourth intersection after. 
		15:
			SceneTransition.ChangeScene("res://Scenes/Intersections/fifth_intersection.tscn")
		18:
			SceneTransition.ChangeScene("res://Scenes/Intersections/sixth_intersection.tscn")
			# Show boss message after. Heal and restore mana.
		_: 
			SceneTransition.ChangeScene("res://Scenes/battle.tscn")

func _on_enemy_died(): 
	next_room_button.show()
#	PlayerStats.ap = PlayerStats.max_ap
	player_battle_action_buttons.hide() 
	


	
	
	

	
