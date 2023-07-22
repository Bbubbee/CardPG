extends Label

func ShowDamageTaken(damage):
	text = "-"+str(damage) 
	$DamageTakenPlayer.play("DamageTaken")


func _on_damage_taken_player_animation_finished(_anim_name):
	queue_free()
