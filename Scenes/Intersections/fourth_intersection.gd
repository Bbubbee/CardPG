extends "res://Scripts/intersection.gd"


func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_four[story_text.intersection_position]
	pass
	
func _process(_delta):
	information_text.text = story_text.intersection_four[story_text.intersection_position]

func ButtonAEffect():
	story_text.intersection_position = "option a"
	choice_buttons.hide()
	next_button.show() 


func ButtonBEffect():
	story_text.intersection_position = "option b"
	PlayerStats.action_dictionary["crux"] = load("res://Scenes/Action Buttons/crux.tscn")
	$UnlockSfx.play()
	choice_buttons.hide()
	next_button.show() 
