extends Node2D
class_name Game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var day : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Game started")
	print("Current day: "+str(day))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func advance_to_next_day():
	day += 1
	print("Current day: "+str(day))
	
	if (day >= 2):
		finish_game()
		
func finish_game():
	print("Game finished")
	get_tree().quit()
	#in the future change to menu scene
