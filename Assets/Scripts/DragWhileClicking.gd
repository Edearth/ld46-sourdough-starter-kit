extends RigidBody2D

var dragging = false
var dragOffsetFromObjectCenter = Vector2.ZERO
export (float) var SNAP_TO_DRAG_FORCE = 20
export (float) var LINEAR_DAMP_WHILE_DRAGGING = 20
export (float) var LINEAR_DAMP_WHEN_DROPPED = -1
export (float) var ANGULAR_DAMP_WHILE_DRAGGING = 10
export (float) var ANGULAR_DAMP_WHEN_DROPPED = -1
export (float) var GRAVITY_WHILE_DRAGGING = 1
export (float) var GRAVITY_WHEN_DROPPED = 30

func _ready():
	gravity_scale = GRAVITY_WHEN_DROPPED
	linear_damp = LINEAR_DAMP_WHEN_DROPPED
	angular_damp = ANGULAR_DAMP_WHEN_DROPPED

func _physics_process(delta):
	if dragging:
		var mousePosition : Vector2 = get_viewport().get_mouse_position()
		var dragInitialPoint : Vector2 = global_transform.xform(dragOffsetFromObjectCenter)
		var distanceUntilDragPoint : Vector2 = mousePosition - dragInitialPoint
		var distanceToMassCenter : Vector2 = mousePosition - position
		var force : Vector2 = distanceUntilDragPoint*delta*SNAP_TO_DRAG_FORCE
		apply_impulse(distanceUntilDragPoint, force)
		apply_torque_impulse(distanceToMassCenter.cross(force))

func _on_Sprite_click():
	dragging = true
	gravity_scale = GRAVITY_WHILE_DRAGGING
	linear_damp = LINEAR_DAMP_WHILE_DRAGGING
	angular_damp = ANGULAR_DAMP_WHILE_DRAGGING
	var mousePosition = get_viewport().get_mouse_position()
	dragOffsetFromObjectCenter = global_transform.xform_inv(mousePosition)
	print ("grabbed")

func _on_Sprite_release():
	dragging = false
	gravity_scale = GRAVITY_WHEN_DROPPED
	linear_damp = LINEAR_DAMP_WHEN_DROPPED
	angular_damp = ANGULAR_DAMP_WHEN_DROPPED
	print ("dropped")
