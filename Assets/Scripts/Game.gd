extends Node2D
class_name Game

var day : int = 0

export (NodePath) var _sourdoughParticleContainer
onready var sourdoughParticleContainer = get_node(_sourdoughParticleContainer) 

func _ready():
	print ("Game started")
	print("Current day: "+str(day))

func advance_to_next_day():
	day += 1
	print("Current day: "+str(day))
	sourdoughParticleContainer.advance_to_next_day()
	
	if (day > 10):
		finish_game()

func finish_game():
	print("Game finished")
	get_tree().quit()
	#in the future change to menu scene instead
