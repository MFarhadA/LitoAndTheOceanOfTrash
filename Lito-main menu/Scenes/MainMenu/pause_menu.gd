extends Control

@export var SettingMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/setting.tscn")

func _on_play_button_pressed():
	get_tree().paused = false
	queue_free()

func _on_setting_button_pressed():
	get_tree().paused = false
	var SettingMenuInstance = SettingMenu.instantiate()
	add_child(SettingMenuInstance)

func _on_exit_button_pressed():
	get_tree().quit()
