extends "res://Scripts/intersection.gd"




func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_three[story_text.intersection_position]

	
func _process(_delta):
	information_text.text = story_text.intersection_three[story_text.intersection_position]


func _on_choice_button_a_pressed():
	story_text.intersection_position = "option a"
	PlayerStats.has_upgraded_sword = true 
	choice_buttons.hide()
	next_button.show() 


func _on_choice_button_b_pressed():
	story_text.intersection_position = "option b"
	PlayerStats.has_shield = true
	choice_buttons.hide()
	next_button.show() 
