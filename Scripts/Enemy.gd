extends Node2D

signal died 
signal end_turn

@onready var hp_label = $Label
@onready var animation_player = $AnimationPlayer

var attack_damage = 3
var hp = 25: 
	set(new_hp):
		hp = new_hp
		hp_label.text = str(hp) + "hp"
var target = null
	# Temp solution: needed for DealDamage().


func Attack(target) -> void:
	await get_tree().create_timer(0.4).timeout 
	animation_player.play("Attack")
	self.target = target
	await animation_player.animation_finished
	self.target = null 
	emit_signal("end_turn")

func TakeDamage(amount): 
	animation_player.play("Shake")
	await animation_player.animation_finished
	self.hp -= amount 
	
	if IsDead():
		emit_signal("died") 
		queue_free()

func DealDamage(): 
	print("deal damage") 
	target.hp -= attack_damage
	
func IsDead():
	return hp <= 0  # If dead return true.


		

		
