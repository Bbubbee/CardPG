extends Node

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

func SetHp(new_hp):
	hp = min(new_hp, max_hp) 
	emit_signal("hp_changed", hp)
	
func SetAp(new_ap):
	ap = min(new_ap, max_ap) 
	emit_signal("ap_changed", ap)

func SetMp(new_mp):
	mp = min(new_mp, max_mp) 
	emit_signal("mp_changed", mp)



