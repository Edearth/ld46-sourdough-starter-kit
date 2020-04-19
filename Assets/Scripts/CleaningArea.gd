extends Area2D

export (NodePath) var _insideContainer
onready var insideContainer = get_node(_insideContainer)

func _ready():
	pass

func cleanStrayParticles():
	for body in get_overlapping_bodies():
		if "Particle" in body.name:
			if not insideContainer.overlaps_body(body):
				body.queue_free()
