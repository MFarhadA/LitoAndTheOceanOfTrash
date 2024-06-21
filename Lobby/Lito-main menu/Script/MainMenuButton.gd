extends VBoxContainer

@export var sceneToLoad : PackedScene 
@export var SettingMenu : PackedScene 
@export var CreditMenu : PackedScene 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(sceneToLoad)


func _on_setting_button_pressed():
	var SettingMenuInstance = SettingMenu.instantiate()
	get_tree().root.get_node("MainMenu").add_child(SettingMenuInstance)


func _on_credit_button_pressed():
	var CreditMenuInstance = CreditMenu.instantiate()
	get_tree().root.get_node("MainMenu").add_child(CreditMenuInstance)

func _on_exit_button_pressed():
	get_tree().quit()

