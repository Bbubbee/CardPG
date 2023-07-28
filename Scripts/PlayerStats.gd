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
	
var action_buttons : Array[PackedScene]
var enemies_to_face : Array[PackedScene] 

# Action numbers. Just damage because I don't want to have too many clogging memory.
# Refer to their action buttons to see their cost and mp use. 
var SLASH_DAMAGE = 4
var FIREBALL_DAMAGE = 9
var DRAIN_DAMAGE = 3


var has_upgraded_sword = false
var SLASH_DAMAGE_UPGRADED = 200
var has_shield = false
var SHIELD_BLOCK = 2
var skele_route = false

var current_level = 1


# Keeps track of what intersection the player is at.
var intersection = 1


func SetHp(new_hp):
	var old_hp = hp 
	hp = clamp(new_hp, 0, max_hp) 
	if old_hp == hp:
		return
	emit_signal("hp_changed", hp)
	
func SetAp(new_ap):
	var old_ap = ap 
	ap = clamp(new_ap, 0, max_ap) 
	if old_ap == ap:
		return
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")

func SetMp(new_mp):
	var old_mp = mp 
	mp = clamp(new_mp, 0, max_mp) 
	if old_mp == mp:
		return
	emit_signal("mp_changed", mp)


func _ready():
	action_buttons.append(load("res://Scenes/sword_action_button.tscn")) 
	action_buttons.append(load("res://Scenes/heal_action_button.tscn")) 
	action_buttons.append(load("res://Scenes/meditate_button.tscn")) 
#	action_buttons.append(load("res://Scenes/drain_action_button.tscn")) 
#	action_buttons.append(load("res://Scenes/fireball_action_button.tscn"))
#	action_buttons.append(load("res://Scenes/Action Buttons/blight.tscn"))
	action_buttons.append(load("res://Scenes/Action Buttons/rend.tscn"))  
	

func TakeDamage(dmg):
	if has_shield:
		hp -= dmg-SHIELD_BLOCK
	else:
		hp -= dmg
		
	if hp <= 0:
		Dies()

func RestoreStats(): 
	hp = max_hp
	mp = max_mp

func Dies():
	SceneTransition.ChangeScene("res://Scenes/game_over.tscn")


func AddAction(action): 
	action_buttons.append(action) 
	

func RemoveAction(): 
	pass
	



