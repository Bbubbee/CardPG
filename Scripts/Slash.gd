extends Node2D


# Destroy Slash node when animation is finished
func _on_animation_player_animation_finished(anim_name):
	queue_free()
 
