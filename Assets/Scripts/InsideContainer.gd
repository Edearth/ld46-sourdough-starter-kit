extends Area2D

#onready var parent = get_parent()
export (PackedScene) var airParticle

func _ready():
	pass 

func advance_to_next_day():
	var slurryParticles = []
	for body in get_overlapping_bodies():
		if "Particle" in body.name:
			if "Air" in body.name:
				pass#if randi()%2:
				#deleteParticle(body)
			reparentParticle(body, self)
			if "Slurry" in body.name:
				slurryParticles.append(body)
	for slurry in slurryParticles:
		var instance = airParticle.instance()
		self.add_child(instance)
		instance.global_position = slurry.global_position

func get_slurry_particles():
	var slurries = []
	for body in get_overlapping_bodies():
		if "Particle" in body.name and "Slurry" in body.name:
			slurries.append(body)
	return slurries

func deleteParticle(body):
	body.queue_free()

func reparentParticle(node, new_parent):
	var position = node.global_position
	node.get_parent().remove_child(node)
	new_parent.add_child(node)
	node.set_owner(new_parent)
	node.global_position = position
