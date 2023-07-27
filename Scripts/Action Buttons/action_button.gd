extends Button

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")
var pressable = true

@export var damage: int
@export var mp_cost: int
@export var ap_cost: int = 1

@onready var sound_effect = $SoundEffect
@onready var button_sfx = $ButtonSfx

func _on_pressed():
	pass


func _on_cooldown_timeout():
	pressable = true
	

func PerformAction(dmg, target): 
	target.TakeDamage(dmg)


func _on_mouse_entered():
	button_sfx.play() 
