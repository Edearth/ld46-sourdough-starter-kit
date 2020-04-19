extends Control

onready var visibleColor = Color(1,1,1,1)
onready var invisibleColor = Color(1,1,1,0)

onready var timeUntilFadeOut : Timer = get_node("TimeUntilFadeOut")
onready var tween : Tween = get_node("Tween")

func _on_Game_day_advance():
	tween.interpolate_property(self, "modulate", invisibleColor, visibleColor, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	timeUntilFadeOut.start(3)

func _on_TimeUntilFadeOut_timeout():
	tween.interpolate_property(self, "modulate", visibleColor, invisibleColor, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
