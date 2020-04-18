extends Sprite

signal click
signal release

func _unhandled_input(event):
	if (event is InputEventMouseButton
			and event.is_pressed()
			and not event.is_echo()
			and event.button_index == BUTTON_LEFT):
		var pos = global_position + offset - ( (texture.get_size() / 2.0) if centered else Vector2() )
		if Rect2(pos, texture.get_size()).has_point(event.position):
			emit_signal("click")
			get_tree().set_input_as_handled()
	elif (event is InputEventMouseButton
			and not event.is_pressed()
			and not event.is_echo()
			and event.button_index == BUTTON_LEFT):
		emit_signal("release")
