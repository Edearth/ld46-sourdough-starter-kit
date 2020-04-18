extends Node2D
class_name Game

var day : int = 0

func _ready():
	print ("Game started")
	print("Current day: "+str(day))

func advance_to_next_day():
	day += 1
	print("Current day: "+str(day))
	
	if (day >= 2):
		finish_game()
		
func finish_game():
	print("Game finished")
	get_tree().quit()
	#in the future change to menu scene instead
