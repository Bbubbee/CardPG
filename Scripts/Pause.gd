extends Control


@onready var label = $Panel/CurrentLevel 

func _process(_delta):
	label.text = "Current level: "+str(LevelManager.current_level)


func _on_button_pressed():
	var new_pause_state = not get_tree().paused 
	get_tree().paused = new_pause_state
	visible = new_pause_state

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused 
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_quit_button_pressed():
	get_tree().quit()
