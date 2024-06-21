extends VBoxContainer

@export var sceneToLoad : PackedScene 
@export var SettingMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/setting.tscn")
@export var CreditMenu : PackedScene = preload("res://Lito-main menu/Scenes/MainMenu/Credit.tscn")

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Lobby/Lobby.tscn")

func _on_setting_button_pressed():
	var SettingMenuInstance = SettingMenu.instantiate()
	get_tree().root.get_node("MainMenu").add_child(SettingMenuInstance)

func _on_credit_button_pressed():
	var CreditMenuInstance = CreditMenu.instantiate()
	get_tree().root.get_node("MainMenu").add_child(CreditMenuInstance)

func _on_exit_button_pressed():
	get_tree().quit()

