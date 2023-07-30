extends Control


@onready var level_label = $LevelLabel

func _ready():
	BgMusic.PauseMusic()
	level_label.text = "Current level: "+str(LevelManager.current_level)

func _on_quit_button_pressed():
	$SelectSfx.play()
	get_tree().quit()



func _on_restart_button_mouse_entered():
	$ButtonSfx.play()


func _on_quit_button_mouse_entered():
	$ButtonSfx.play()


func _on_restart_button_pressed():
	$SelectSfx.play()	
	BgMusic.PlayMusic()
	LevelManager.RestartLevel()
