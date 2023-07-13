extends Node2D

var hp = 25: 
	set = SetHp  # Called whenever it's set. 

func SetHp(new_hp): 
	hp = new_hp
	$Label.text = str(hp) + "hp"
