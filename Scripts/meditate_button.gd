extends "res://Scripts/Action Buttons/action_button.gd"

@export var mp_restore: int = 1

func _ready():
	mp_restore = snappedi(PlayerStats.max_mp * 0.60, 1)
	hover_info.description = "Meditate. Restores 60% of MAX MP. ("+str(mp_restore)+" MP)."

func _on_pressed():
	var player = PlayerStats
	if player:   
		sound_effect.play()
		player.ap -= 1 
		player.mp += mp_restore
 
