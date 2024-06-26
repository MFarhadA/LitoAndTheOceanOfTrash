extends Control

@export var SettingMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/setting.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("Menu"):
		_on_play_button_pressed()

func _on_play_button_pressed():
	Click.play()
	get_tree().paused = false
	queue_free()

func _on_setting_button_pressed():
	Click.play()
	get_tree().paused = false
	var SettingMenuInstance = SettingMenu.instantiate()
	add_child(SettingMenuInstance)

func _on_exit_button_pressed():
	PlayerStats.save()
	BoatStats.save()
	Click.play()
	get_tree().quit()
