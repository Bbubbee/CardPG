extends Label

var red = Color(1.0, 0.0, 0.0, 1.0)
var green = Color(0.0, 1.0, 0.0, 1.0) 
var blue = Color(0.0, 0.0, 1.0, 1.0)

func ShowDamageTaken(damage):
	text = damage
	add_theme_color_override("font_color", red)
	$DamageTakenPlayer.play("DamageTaken")

func ShowStatIncreased(change):
	text = change
	add_theme_color_override("font_color", green)
	$DamageTakenPlayer.play("DamageTaken")
	
func ShowStatChanged(change):
	text = change
	add_theme_color_override("font_color", blue)
	$DamageTakenPlayer.play("DamageTaken")


func _on_damage_taken_player_animation_finished(_anim_name):
	queue_free()
