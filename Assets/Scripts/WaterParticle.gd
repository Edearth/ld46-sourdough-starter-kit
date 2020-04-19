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

func transformParticlesInSlurries(body1, body2):
	instantiateSlurryOverNode(body1)
	body1.queue_free()
	instantiateSlurryOverNode(body2)
	body2.queue_free()

func _on_WaterParticle_body_entered(body):
	if "FlourParticle" in body.name:
		call_deferred("transformParticlesInSlurries", body, self)
