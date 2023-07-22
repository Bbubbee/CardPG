extends Node

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

signal end_turn
signal hp_changed(val) 
signal ap_changed(val)
signal mp_changed(val)  

var max_hp = 25
var hp = max_hp: 
	set = SetHp
var max_ap = 3
var ap = max_ap:
	set = SetAp
var max_mp = 10
var mp = max_mp:
	set = SetMp
var damage = 6
var fireball_damage = 9
var action_buttons : Array[PackedScene] 

# Keeps track of what intersection the player is at
var intersection = 1


func SetHp(new_hp):
	hp = clamp(new_hp, 0, max_hp) 
	emit_signal("hp_changed", hp)
	
func SetAp(new_ap):
	ap = clamp(new_ap, 0, max_ap) 
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")

func SetMp(new_mp):
	mp = clamp(new_mp, 0, max_mp) 
	emit_signal("mp_changed", mp)


func _ready():
	action_buttons.append(load("res://Scenes/sword_action_button.tscn")) 
	action_buttons.append(load("res://Scenes/heal_action_button.tscn")) 
	action_buttons.append(load("res://Scenes/meditate_button.tscn")) 
	



