extends Control

func _ready():
	BgMusic.PauseMusic()


func _on_play_button_pressed():
	BgMusic.PlayMusic()
	$SelectSfx.play()	
	$VBoxContainer/PlayButton.disabled = true 
	LevelManager.RestartGame()


func _on_quit_button_pressed():
	$SelectSfx.play()
	get_tree().quit()


func _on_play_button_mouse_entered():
	$ButtonSfx.play()


func _on_quit_button_mouse_entered():
	$ButtonSfx.play()
