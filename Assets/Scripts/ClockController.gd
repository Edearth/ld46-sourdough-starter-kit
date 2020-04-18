extends Node2D

export (NodePath) var _game
onready var game : Game = get_node(_game) as Game

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Sprite_click():
	print("> clock sprite clicked")
	game.advance_to_next_day()