extends Node2D

export (PackedScene) var particleType
export (float) var amount = 100

func _ready():
	for i in range(amount):
		var instance = particleType.instance()
		self.add_child(instance)
