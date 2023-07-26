extends "res://Scripts/intersection.gd"


func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_six[story_text.intersection_position]
	choice_buttons.hide()
	next_button.show() 
	
