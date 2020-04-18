extends RigidBody2D
class_name WaterParticle

export (PackedScene) var slurryParticle

onready var parent = get_parent()

func _ready():
	pass # Replace with function body.
	
func instantiateSlurryOverNode(node : Node2D):
	var instance = slurryParticle.instance()
	parent.add_child(instance)
	instance.global_position = node.global_position
	

func _on_WaterParticle_body_entered(body):
	if "FlourParticle" in body.name:
		instantiateSlurryOverNode(body)
		body.queue_free()
		instantiateSlurryOverNode(self)
		self.queue_free()
