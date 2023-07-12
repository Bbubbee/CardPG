extends Node

@onready var hpLabel = $Enemy/Label

func _on_sword_button_pressed():
	print("attack!") 
	
	hpLabel.text = "15hp" 
