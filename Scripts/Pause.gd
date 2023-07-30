extends Control


@onready var label = $Panel/CurrentLevel 
@onready var select_sfx = $'../SelectSfx'
@onready var button_sfx = $'../ButtonSfx'

func _process(_delta):
	label.text = "Current level: "+str(LevelManager.current_level)


# PAUSE BUTTON.
func _on_button_pressed():
	select_sfx.play()
	var new_pause_state = not get_tree().paused 
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _on_button_mouse_entered():
	button_sfx.play()

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused 
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_quit_button_pressed():
	select_sfx.play()
	get_tree().quit()


func _on_quit_button_mouse_entered():
	button_sfx.play()


func _on_restart_level_pressed():
	button_sfx.play()
	
	var new_pause_state = not get_tree().paused 
	get_tree().paused = new_pause_state
	visible = new_pause_state
	
	PlayerStats.RestoreStats()
	LevelManager.RestartLevel()

func _on_restart_level_mouse_entered():
	button_sfx.play()
