extends Node2D

signal died 
signal attack

@onready var hp_label = $Label
@onready var animation_player = $AnimationPlayer

var hp = 25: 
	set = SetHp
var attack_damage = 3

func SetHp(new_hp): 
	hp = new_hp
	hp_label.text = str(hp) + "hp"
	
	if hp <= 0: 
		emit_signal("died") 
		queue_free()
	else: 		
		animation_player.play("Shake") 
		await animation_player.animation_finished
		await get_tree().create_timer(0.2).timeout
		
		# Attack player
		animation_player.play("Attack")
		await animation_player.animation_finished
		
		var battle_scene = get_tree().current_scene
		var player = battle_scene.find_child("PlayerStats") 
		player.hp -= attack_damage
