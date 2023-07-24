extends Node

@onready var information_text = $Control/InformationPanel/InformationText
var story_text = preload("res://Assets/Resources/story_text.tres")
@onready var choice_buttons = $Control/ButtonChoicesContainer
@onready var next_button = $Control/NextButton



func _on_choice_button_a_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")


func _on_choice_button_b_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")


func _on_next_button_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn") 
