extends Button

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")
var pressable = true

@export var damage: int = 1
@export var mp_cost: int = 0
@export var ap_cost: int = 1

@onready var sound_effect = $SoundEffect
@onready var button_sfx = $ButtonSfx
@onready var cool_down = $Cooldown
@onready var hover_info = $HoverInfo 

func _ready():
	hover_info.description = "Dmg:"+str(damage) + ", MP:"+str(mp_cost) + ", AP:"+str(ap_cost)

func _on_pressed():
	if pressable:
		pressable = false
		cool_down.start() 
		if PlayerStats.mp >= mp_cost and PlayerStats.ap > 0:
			MainEffect()


# OVERRIDE - If action doesn't deal damage. Heal, meditate, etc. 
# This deals damage to an enemy. It will reduce the players ap and mp accordingly.
func MainEffect(): 
	var enemy = battle_units.enemy
	enemy.TakeDamage(damage)
	# Remember: Do these after the main effect.	 
	# Makes it so these ONLY happens if the main effect actually occurs. 
	# Some actions (like heal) will only happen if their hp < max_hp.
	PlaySfx() 
	PlayerStats.ap -= ap_cost 
	PlayerStats.mp -= mp_cost


# OVERRIDE - If there are more or no sound effect to play
func PlaySfx():
	sound_effect.play()

func _on_cooldown_timeout():
	pressable = true

func _on_mouse_entered():
	button_sfx.play() 
