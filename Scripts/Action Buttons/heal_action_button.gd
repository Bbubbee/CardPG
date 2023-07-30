extends "res://Scripts/Action Buttons/action_button.gd"

var heal_amount: int = 0

func _ready():
	heal_amount = snappedi(PlayerStats.max_hp * 0.25, 1)
	hover_info.description = "Heals 25% of MAX HP \n("+str(heal_amount)+" HP). Costs "+str(mp_cost)+" MP."

func MainEffect():
	
	if PlayerStats.hp < PlayerStats.max_hp: 
		PlayerStats.hp += heal_amount
		
		PlayerStats.ap -= ap_cost
		PlayerStats.mp -= mp_cost
		PlaySfx()
