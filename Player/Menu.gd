extends Button


@export var SettingMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/setting.tscn")
@export var PauseMenu : = preload("res://Lito-main menu/Scenes/MainMenu/pause_menu.tscn")

func _input(event):
	if event.is_action_pressed("Menu"):
		_on_pressed()

func _on_pressed():
	Click.play()
	get_tree().paused = true
	var PauseMenuInstance = PauseMenu.instantiate()
	add_child(PauseMenuInstance)
