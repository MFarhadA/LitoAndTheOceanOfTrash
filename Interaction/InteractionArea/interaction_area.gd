extends Area2D
class_name InteractionArea

@export var action_name : String = "interact"
@onready var button = $"../Control/divingbutton"
@onready var player = $"../Player"
@export var DivingShop = preload("res://Interaction/DivingStore/DivingStore.tscn")

func _on_body_entered(body):
	if body.name == "interactPlayer":
		button.show()


func _on_body_exited(body):
	if body.name == "interactPlayer":
		button.hide()

func _on_button_pressed():
	var SettingMenuInstance = DivingShop.instantiate()
	get_tree().root.get_node("MainMenu").add_child(SettingMenuInstance)
