extends "res://Scripts/intersection.gd"

var counter = 1

func _ready():
	story_text.intersection_position = "start"
	information_text.text = story_text.intersection_one[story_text.intersection_position]
	
func _process(_delta):
	information_text.text = story_text.intersection_one[story_text.intersection_position]

func ButtonAEffect():
	story_text.intersection_position = "option a"
	$Control/ButtonChoicesContainer.hide()
	$Control/NextButton.show()
	$UnlockSfx.play()
	PlayerStats.action_dictionary["drain"] = load("res://Scenes/drain_action_button.tscn")


func ButtonBEffect():
	story_text.intersection_position = "option b"
	$Control/ButtonChoicesContainer.hide()
	$Control/NextButton.show() 
	$UnlockSfx.play()
	PlayerStats.action_dictionary["fireball"] = load("res://Scenes/fireball_action_button.tscn")

