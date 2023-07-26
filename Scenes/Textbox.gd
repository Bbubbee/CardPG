extends RichTextLabel

# Checks if another item is being hovered. If so, display the items information.
var is_hovering = false 
var battle_log = "this is the battle log"

func _process(delta):
	if is_hovering:
		return 
	else: 
		text = battle_log 
