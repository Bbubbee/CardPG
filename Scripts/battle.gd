extends Node

func _on_sword_button_pressed():
	print("attack!") 
	
	$Enemy.hp -= 4
