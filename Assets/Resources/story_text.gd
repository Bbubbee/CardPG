extends Resource

class_name StoryText

var intersection_position 

var intersection_one = {
	"start": 
		"You enter a corridor that branches into two directions.
		\nDo you go left (A) or right (B)?",
	"option a": 
		"Runes are etched into the walls. As you pass a sense of renewal courses through you. 
		\nGained: DRAIN.", 
	"option b": 
		"You find a glyph on a pedestal and pick it up. Warmth emenates from it. 
		\nGained: FIREBALL"
}

var intersection_two = {
	"start": "Your path diverges once again. The left passage leads into a crypt where clacking footseps can be heard within. The right leads to a dark passage covered with cobwebs.
	\nDo you go left (A) or right (B)",
	"option a": "You descend into the crypt.", 
	"option b": "You cut through the dark and the webs.", 
}

var intersection_three = {
	"start": 
		"You find a wounded wolf heaving on the ground. A glint of steel protrudes from it's neck. Despite it's injury it menacingly stares at you.
		\nDo you help it (A) or cautiously leave? (B)",
	"option a": 
		"You slide the blade from it's body. It lets out a wild howl and mauls you. It scurries away.
		\n-9 health 
		\nGained: UPGRADED SWORD", 
	"option b": 
		"You creep around the edges of the room. It's eyes follows you eerily. Suddenly it pounces at you, but you swiftly slip into a room and slam the door. Inside, you find a hefty wooden shield.
		\nGained: SHIELD"
}

var thoughts = "
	Maybe the cultist sacrifice animals and summon the grim beast. It is a moving mass of darkness with animal heads sticking out of it
	The player runs into the cultists on the last floor 
"

var intersection_four = {
	"start": "Ahead you see a crowd of hooded figures chanting. They encircle a deceased doe laying on archaic symbols.
	\nDo you intervene (A) or sneak by (B)?",
	"option a": "You storm the ritual with a flurry of swings and spells. After a brief retailliation they disperse into the dark. You pick up the doe and rest it in a remote area of the dungeon.", 
	"option b": "You sneak through the darkness and enter a room. A long staff lies on a pedestal. Ebony wood runs along it's shaft and wraps around a glowing crystal.
	\nGained: CRUX", 
}

var intersection_five = {
	"start": "You come across a shrine of a smiling child. A voice emenates in your mind. 
	\n'A great trial awaits you. Shall I empower your hand (A) or your mind(B)?'",
	"option a": "Gained: REND", 
	"option b": "Gained: BLIGHT", 
}

var intersection_six = {
	"start": "This is your last moment of respite. Ahead lies the grim beast.
	\nHP and MP RESTORED",
	"option a": "a text", 
	"option b": "b text", 
}


var player_action_description = {
	"sword": "You swing with your sword: 5dmg"
}

var enemy_action_description = {
	
}



