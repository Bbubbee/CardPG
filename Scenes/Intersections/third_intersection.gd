extends "res://Scripts/intersection.gd"




func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_three[story_text.intersection_position]

	
func _process(_delta):
	information_text.text = story_text.intersection_three[story_text.intersection_position]


func ButtonAEffect():
	story_text.intersection_position = "option a"
	PlayerStats.has_upgraded_sword = true 
	$UnlockSfx.play()
	choice_buttons.hide()
	next_button.show() 


func ButtonBEffect():
	story_text.intersection_position = "option b"
	PlayerStats.has_shield = true
	$UnlockSfx.play()
	choice_buttons.hide()
	next_button.show() 
