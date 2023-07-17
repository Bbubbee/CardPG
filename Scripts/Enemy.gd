extends Node2D

signal died 
signal end_turn

@onready var hp_label = $Label
@onready var animation_player = $AnimationPlayer

var attack_damage = 3
var max_hp = 25
var hp = max_hp: 
	set(new_hp):
		hp = clamp(new_hp, 0, max_hp)
		hp_label.text = str(hp) + "hp"
var target = null  # Temp implementation: needed for DealDamage().


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
		Dies()

func DealDamage(): 
	print("deal damage") 
	target.hp -= attack_damage
	
func Dies(): 
	animation_player.play("Fades")
	await animation_player.animation_finished
	emit_signal("died") 
	queue_free()
	
func IsDead():
	return hp <= 0  # If dead return true.


		

		
