extends Node



func _on_start_button_pressed():
	PlayerStats.LevelUp(10, 5)
	PlayerStats.RestoreStats()
	SceneTransition.ChangeScene("res://Scenes/Intersections/second_intersection.tscn")	
