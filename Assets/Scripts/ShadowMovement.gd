extends Sprite

export (float) var FIXED_HEIGHT = 400

func _process(delta):
	self.global_position.x = get_parent().global_position.x
	self.global_position.y = FIXED_HEIGHT
	self.global_rotation = 0
