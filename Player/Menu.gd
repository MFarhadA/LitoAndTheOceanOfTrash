extends Button


@export var SettingMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/setting.tscn")
@export var PauseMenu : = preload("res://Lito-main menu/Scenes/MainMenu/pause_menu.tscn")

func _on_pressed():
	get_tree().paused = true
	var PauseMenuInstance = PauseMenu.instantiate()
	add_child(PauseMenuInstance)
