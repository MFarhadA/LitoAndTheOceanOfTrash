extends Node2D

@export var DivingShop : PackedScene = preload("res://Interaction/DivingStore/DivingStore.tscn")

func _ready():
	var button = $Control/divingbutton
	if button:
		print("ada")
		if not button.is_connected("pressed", Callable(self, "_on_divingbutton_pressed")):
			button.connect("pressed", Callable(self, "_on_divingbutton_pressed"))
	else:
		print("tdk ada")

func _process(delta):
	pass

func _on_divingbutton_pressed():
	var DivingInstance = DivingShop.instantiate()
	add_child(DivingInstance)
	print("pencet")
