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
@export var damage = 15
@export var fireball_damage = 8

func _ready():
	battle_units.player = self

func _exit_tree():
	battle_units.player = null


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




