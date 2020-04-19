extends Button

export (String, "menu", "game") var scene

func _on_Button_pressed():
	SceneLoader.switch_scene(scene)
