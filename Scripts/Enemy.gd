extends Node2D

signal died 

@onready var hp_label = $Label
@onready var animation_player = $AnimationPlayer

var hp = 25: 
	set = SetHp

func SetHp(new_hp): 
	hp = new_hp
	hp_label.text = str(hp) + "hp"
	
	if hp <= 0: 
		emit_signal("died") 
		queue_free()
	else: 		
		animation_player.play("Shake") 
		await animation_player.animation_finished
		await get_tree().create_timer(0.25).timeout
		animation_player.play("Attack")
