extends Node2D
class_name Game

var day : int = 0

export (NodePath) var _sourdoughParticleContainer
onready var sourdoughParticleContainer = get_node(_sourdoughParticleContainer)

export (NodePath) var _yeastCounter
onready var yeastCounter = get_node(_yeastCounter)
var yeastCount = 0.1

func _ready():
	print ("Game started")
	print("Current day: "+str(day))
	yeastCounter.value = 0

func advance_to_next_day():
	day += 1
	print("Current day: "+str(day))
	sourdoughParticleContainer.advance_to_next_day()
	var slurries = sourdoughParticleContainer.get_slurry_particles()
	yeastCount += len(slurries) * 0.15 + yeastCount * 0.1
	yeastCounter.value = yeastCount
	
	if (day > 10):
		finish_game()

func finish_game():
	print("Game finished")
	get_tree().quit()
	#in the future change to menu scene instead
