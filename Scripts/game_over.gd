extends Control


@onready var level_label = $LevelLabel

func _ready():
	level_label.text = "Current level: "+str(LevelManager.current_level)

func _on_quit_button_pressed():
	get_tree().quit()


func _on_restart_button_pressed():
	PlayerStats.RestoreStats()
	SceneTransition.ChangeScene("res://Scenes/battle.tscn")
