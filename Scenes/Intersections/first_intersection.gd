extends "res://Scripts/intersection.gd"

var counter = 1

func _ready():
	information_text.text = "You enter a corridor that branches into two directions.\nDo you go left (A) or right (B)?"



func _on_choice_button_a_pressed():
	information_text.text = "Runes are etched into the walls. As you pass a sensation of renewal courses through you. \n\nGained action: DRAIN. Mp restored."
	$Control/ButtonChoicesContainer.hide()
	$Control/NextButton.show()
	PlayerStats.action_buttons.append(load("res://Scenes/drain_action_button.tscn")) 


func _on_choice_button_b_pressed():
	information_text.text = "You find a glyph on a pedestal and pick it up. Warmth emenates from it. \n\nGained fireball. MP restored."
	$Control/ButtonChoicesContainer.hide()
	$Control/NextButton.show()
	PlayerStats.action_buttons.append(load("res://Scenes/fireball_action_button.tscn")) 


func ReturnToBattle():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")
