extends Button

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")
var pressable = true

@export var damage: int = 1
@export var mp_cost: int = 0
@export var ap_cost: int = 1

@onready var sound_effect = $SoundEffect
@onready var button_sfx = $ButtonSfx
@onready var cool_down = $Cooldown

func _on_pressed():
	var enemy = battle_units.enemy
	
	if enemy and pressable:
		pressable = false
		cool_down.start() 
		if PlayerStats.mp >= mp_cost:
			MainEffect(enemy)
			BonusEffects()
			PlaySfx()

# OVERRIDE - If action doesn't deal damage. Heal, meditate, etc. 
# This deals damage to an enemy. It will reduce the players ap and mp accordingly.
func MainEffect(enemy): 
	enemy.TakeDamage(damage)
	PlayerStats.ap -= ap_cost
	PlayerStats.mp -= mp_cost 

# OVERRIDE - If there are any other additional effects. 
func BonusEffects():
	pass 

# OVERRIDE - If there are more or no sound effect to play
func PlaySfx():
	pass

func _on_cooldown_timeout():
	pressable = true

func _on_mouse_entered():
	button_sfx.play() 
