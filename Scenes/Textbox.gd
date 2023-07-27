extends RichTextLabel

var battle_units = preload("res://Assets/Resources/BattleUnits.tres")

# Checks if another item is being hovered. If so, display the items information.
var is_hovering = false 
var battle_log = ""

func _ready():
	battle_units.battle_log = self

func _exit_tree():
	battle_units.battle_log = null
	

func _process(delta):
	if is_hovering:
		return 
	else: 
		text = battle_log 


func AddToBattleLog(text): 
	battle_log += text 
