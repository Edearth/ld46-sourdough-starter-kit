extends Control

onready var visibleColor = Color(1,1,1,1)
onready var invisibleColor = Color(1,1,1,0)

onready var tween : Tween = get_node("Tween")
onready var bread :TextureRect = get_node("Bread")
onready var breadTween : Tween = get_node("Bread/Rotate")
onready var star = get_node("Star")
onready var starTween : Tween = get_node("Star/Rotate")

func _on_Game_game_finished():
	tween.interpolate_property(self, "modulate", invisibleColor, visibleColor, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	
	breadTween.interpolate_property(bread, "rect_rotation", 0, 360, 30.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	breadTween.start()
	starTween.interpolate_property(star, "rect_rotation", 0, 360, 10.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	starTween.start()
