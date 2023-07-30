extends Node



func _on_start_button_pressed():
	$SelectSfx.play()
	$StartButton.disabled = true
	PlayerStats.LevelUp(10, 5)
	PlayerStats.RestoreStats()
	SceneTransition.ChangeScene("res://Scenes/Intersections/second_intersection.tscn")	


func _on_start_button_mouse_entered():
	$ButtonSfx.play()
