extends "res://Scripts/level_2.gd"

func _on_start_button_pressed():
	PlayerStats.LevelUp(20, 5)
	PlayerStats.RestoreStats()
	SceneTransition.ChangeScene("res://Scenes/Intersections/fourth_intersection.tscn")	
