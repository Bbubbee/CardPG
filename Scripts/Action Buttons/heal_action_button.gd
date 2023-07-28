extends "res://Scripts/Action Buttons/action_button.gd"

@export var heal_amount: int = 0

func _ready():
	hover_info.description = "Heals "+str(heal_amount)+"hp, Costs "+str(mp_cost)+"mp"

func MainEffect():
	if PlayerStats.hp < PlayerStats.max_hp: 
		PlayerStats.hp += heal_amount
		
		PlayerStats.ap -= ap_cost
		PlayerStats.mp -= mp_cost
		PlaySfx()
