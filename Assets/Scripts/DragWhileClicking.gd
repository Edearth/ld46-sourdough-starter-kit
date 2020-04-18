extends RigidBody2D

onready var parent = get_parent()
var dragging = false
var dragInitialOffset = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if dragging:
		var mousePosition = get_viewport().get_mouse_position()
		var dragInitialPoint = global_transform.xform(dragInitialOffset)
		apply_impulse(mousePosition - dragInitialPoint, (mousePosition - dragInitialPoint)*delta*10)

func _on_Sprite_click():
	dragging = true
	var mousePosition = get_viewport().get_mouse_position()
	dragInitialOffset = global_transform.xform_inv(mousePosition - parent.position)
	print ("grabbed")

func _on_Sprite_release():
	dragging = false
	print ("dropped")
