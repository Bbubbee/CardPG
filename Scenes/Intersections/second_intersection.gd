extends "res://Scripts/intersection.gd"

var room = 1

func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_two[story_text.intersection_position]
	pass
	
func _process(delta):
	information_text.text = story_text.intersection_two[story_text.intersection_position]

func _on_choice_button_a_pressed():
	story_text.intersection_position = "option a"
	choice_buttons.hide()
	next_button.show() 


func _on_choice_button_b_pressed():
	story_text.intersection_position = "option b"
	choice_buttons.hide()
	next_button.show() 
