extends "res://Scripts/intersection.gd"

var room = 1

func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_two[story_text.intersection_position]
	pass
	
func _process(_delta):
	information_text.text = story_text.intersection_two[story_text.intersection_position]

func ButtonAEffect():
	story_text.intersection_position = "option a"
	PlayerStats.skele_route = true
	choice_buttons.hide()
	next_button.show() 


func ButtonBEffect():
	story_text.intersection_position = "option b"
	choice_buttons.hide()
	next_button.show() 
