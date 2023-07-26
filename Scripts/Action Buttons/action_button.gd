extends Button

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")
var pressable = true

@export var damage: int
@export var mp_cost: int
@export var ap_cost: int = 1

func _on_pressed():
	pass


func _on_cooldown_timeout():
	pressable = true
	

func PerformAction(dmg, target): 
	target.TakeDamage(dmg)
