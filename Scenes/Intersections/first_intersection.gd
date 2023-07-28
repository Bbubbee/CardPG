extends "res://Scripts/intersection.gd"

var counter = 1

func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_one[story_text.intersection_position]
	
func _process(_delta):
	information_text.text = story_text.intersection_one[story_text.intersection_position]

func _on_choice_button_a_pressed():
	story_text.intersection_position = "option a"
	$Control/ButtonChoicesContainer.hide()
	$Control/NextButton.show()
	PlayerStats.AddAction(load("res://Scenes/drain_action_button.tscn"))


func _on_choice_button_b_pressed():
	story_text.intersection_position = "option b"
	$Control/ButtonChoicesContainer.hide()
	$Control/NextButton.show() 
	PlayerStats.AddAction(load("res://Scenes/fireball_action_button.tscn"))

