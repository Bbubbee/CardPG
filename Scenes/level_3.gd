extends "res://Scripts/level_2.gd"

func _on_start_button_pressed():
	PlayerStats.current_level = 3
	SceneTransition.ChangeScene("res://Scenes/Intersections/fourth_intersection.tscn")	
