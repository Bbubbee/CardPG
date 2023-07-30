extends "res://Scripts/battle.gd"


func _ready():
	
	battle_units.battle_scene = self
	ReadyShield()
	SelectEnemies() 
	CreateNewEnemy()
	StartPlayerTurn()
	$UI/BattleActionButtons.hide()

# OVVERRIDE
func SelectEnemies(): 
	enemies.append(load("res://Scenes/Enemies/grim_beast.tscn"))

func _on_next_room_button_pressed():
	$SelectSfx.play()
	next_room_button.disabled = true 
	LevelManager.GoToVictoryScreen()


func PlayAlienSound():
	$UI/BattleActionButtons.show() 
	$AlienSound.play()
