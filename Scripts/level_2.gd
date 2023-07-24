extends Node



func _on_start_button_pressed():
	PlayerStats.current_level = 2
	SceneTransition.ChangeScene("res://Scenes/Intersections/second_intersection.tscn")	
