extends Node2D

export (NodePath) var _game
onready var game : Game = get_node(_game) as Game
onready var hour_handle = get_node("hours")
onready var hour_tween = hour_handle.get_node("Tween")
onready var minute_handle = get_node("minutes")
onready var minute_tween = minute_handle.get_node("Tween")

func animate_handles():
	
	hour_tween.interpolate_property(hour_handle, "rotation", deg2rad(180), deg2rad(720+180), 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	minute_tween.interpolate_property(minute_handle, "rotation", deg2rad(-90), deg2rad(24*(720)-90), 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	hour_tween.start()
	minute_tween.start()
	
func _on_TextureButton_pressed():
	print("> clock sprite clicked")
	game.advance_to_next_day()
	animate_handles()
