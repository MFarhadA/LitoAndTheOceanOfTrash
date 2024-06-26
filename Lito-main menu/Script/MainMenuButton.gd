extends VBoxContainer

@export var sceneToLoad : PackedScene 
@export var SettingMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/setting.tscn")
@export var CreditMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/Credit.tscn")

func _on_play_button_pressed():
	PlayerStats.load_data()
	BoatStats.load_data()
	Click.play()
	get_tree().change_scene_to_file("res://Lobby/Lobby.tscn")

func _on_setting_button_pressed():
	Click.play()
	var SettingMenuInstance = SettingMenu.instantiate()
	get_tree().root.get_node("MainMenu").add_child(SettingMenuInstance)

func _on_credit_button_pressed():
	Click.play()
	var CreditMenuInstance = CreditMenu.instantiate()
	get_tree().root.get_node("MainMenu").add_child(CreditMenuInstance)

func _on_exit_button_pressed():
	Click.play()
	get_tree().quit()
