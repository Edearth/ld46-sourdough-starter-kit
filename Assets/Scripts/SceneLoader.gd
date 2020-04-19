extends Node

var menu_scene = "res://Assets/Scenes/Menu.tscn"
var game_scene = "res://Assets/Scenes/Game.tscn"

func switch_scene(path):
	if path == "menu":
		get_tree().change_scene(menu_scene)
	elif path == "game":
		get_tree().change_scene(game_scene)
