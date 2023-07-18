extends Node2D

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

signal died 
signal end_turn

@export var attack_damage: int = 4
@export var max_hp: int = 35 

@onready var hp_label = $Label
@onready var animation_player = $AnimationPlayer
@onready var hp = max_hp: 
	set(new_hp):
		hp = clamp(new_hp, 0, max_hp)
		hp_label.text = str(hp) + "hp"


func _ready():
	hp_label.text = str(hp)+"hp"
	battle_units.enemy = self

func _exit_tree():
	battle_units.enemy = null

func Attack() -> void:
	await get_tree().create_timer(0.4).timeout 
	animation_player.play("Attack")  # Calls DealDamage().
	await animation_player.animation_finished  
	emit_signal("end_turn")

func TakeDamage(amount): 
	animation_player.play("Shake")
	await animation_player.animation_finished
	self.hp -= amount 
	
	if IsDead():
		Dies()

func DealDamage(): 
	battle_units.player.hp -= attack_damage
	
func Dies(): 
	animation_player.play("Fades")
	await animation_player.animation_finished
	emit_signal("died") 
	queue_free()
	
func IsDead():
	return hp <= 0  # If dead return true.
	

	


		

		
