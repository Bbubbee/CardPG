extends GridContainer



func _ready():
	for key in PlayerStats.action_dictionary:
		var action = PlayerStats.action_dictionary[key].instantiate()
		add_child(action) 

