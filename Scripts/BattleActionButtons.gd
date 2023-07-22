extends GridContainer



func _ready():
	for scene in PlayerStats.action_buttons:
		var button = scene.instantiate()
		add_child(button) 

