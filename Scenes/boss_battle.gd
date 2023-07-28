extends "res://Scripts/battle.gd"


func _ready():
	battle_units.battle_scene = self
	ReadyShield()
	SelectEnemies() 
	CreateNewEnemy()
	StartPlayerTurn()

# OVVERRIDE
func SelectEnemies(): 
	enemies.append(load("res://Scenes/Enemies/grim_beast.tscn"))

func _process(delta):
	pass
