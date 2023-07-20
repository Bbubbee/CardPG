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
	
func StartTurn(): 
	await get_tree().create_timer(0.4).timeout 
	
	# NOTE: Used to check if is dead here. 
	# Redundant because death check happens when enemy takes damage. 
	# Recode if there is means of enemy dying DURING their turn. 
	if not IsDead():
		Attack()
	
		
func Attack() -> void:
	animation_player.play("Attack")  # Calls DealDamage().
	await animation_player.animation_finished  
	emit_signal("end_turn")
	
	
func DealDamage(): 
	PlayerStats.hp -= attack_damage


func TakeDamage(amount): 
	animation_player.play("Shake")
	await animation_player.animation_finished
	self.hp -= amount 
	
	if IsDead():
		Dies()

	
func Dies(): 
	# TEMP: Removes enemy from battle_units early so that the player can not
	# attack it once it's in the process of dying. 
	battle_units.enemy = null
	
	animation_player.play("Fades")
	await animation_player.animation_finished
	emit_signal("end_turn") 
	emit_signal("died") 
	queue_free()
	
func IsDead():
	return hp <= 0  # If dead return true.
	

	


		

		
