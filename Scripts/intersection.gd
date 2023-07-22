extends Node

@onready var information_text = $Control/InformationPanel/InformationText

func _on_choice_button_a_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")


func _on_choice_button_b_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")


func _on_next_button_pressed():
	SceneTransition.ChangeScene("res://Scenes/battle.tscn") 
