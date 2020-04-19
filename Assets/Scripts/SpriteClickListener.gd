extends Sprite

signal click
signal release

var dragging = false

func _unhandled_input(event):
	if (event is InputEventMouseButton
			and event.is_pressed()
			and not event.is_echo()
			and event.button_index == BUTTON_LEFT):
		var pos = global_position + (offset - ( (texture.get_size() / 2.0) if centered else Vector2() ) * scale)
		if Rect2(pos, texture.get_size() * scale).has_point(event.position):
			emit_signal("click")
			dragging = true
			get_tree().set_input_as_handled()
	elif (dragging
			and event is InputEventMouseButton
			and not event.is_pressed()
			and not event.is_echo()
			and event.button_index == BUTTON_LEFT):
		emit_signal("release")
