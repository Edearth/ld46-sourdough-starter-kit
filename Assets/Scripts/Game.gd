extends Node2D
class_name Game

signal day_advance
signal game_finished

export (NodePath) var _dayCountLabel
onready var dayCountLabel = get_node(_dayCountLabel)
var day : int = 0

export (NodePath) var _sourdoughParticleContainer
onready var sourdoughParticleContainer = get_node(_sourdoughParticleContainer)

export (NodePath) var _strayParticleCleaner
onready var strayParticleCleaner = get_node(_strayParticleCleaner)

export (NodePath) var _yeastCounter
onready var yeastCounter = get_node(_yeastCounter)
var yeastCount = 0.1

export (PackedScene) var ingredientsScene
var previousIngredients = null

func _ready():
	print ("Game started")
	print("Current day: "+str(day))
	yeastCounter.value = 0
	replace_ingredients()

func advance_to_next_day():
	day += 1
	dayCountLabel.set_text(str(day))
	
	replace_ingredients()
	
	strayParticleCleaner.cleanStrayParticles()
	sourdoughParticleContainer.advance_to_next_day()
	var slurries = sourdoughParticleContainer.get_slurry_particles()
	yeastCount += len(slurries) * 0.15 + yeastCount * 0.1
	yeastCount = min(yeastCount, len(slurries))
	yeastCounter.value = yeastCount
	
	if true:#if (yeastCount >= 100):
		finish_game()
	else:
		emit_signal("day_advance")
	
func replace_ingredients():
	if previousIngredients != null:
		previousIngredients.queue_free()
	var instance = ingredientsScene.instance()
	add_child(instance)
	previousIngredients = instance

func finish_game():
	print("Game finished")
	emit_signal("game_finished")
