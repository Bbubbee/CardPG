extends Control



func _on_start_button_pressed():
	$SelectSfx.play()
	LevelManager.ShowNextScene()
	


func _on_start_button_mouse_entered():
	$ButtonSfx.play()
