extends CanvasLayer

@onready var player = get_parent().get_node("../Player")

var kaki1 = 500
var kaki2 = 2000
var kaki3 = 5000

var tas1 = 500
var tas2 = 2000
var tas3 = 5000

func _on_cancel_pressed():
	get_tree().paused = false
	visible = false

func _buy(opsi):
	if player._money() >= opsi:
		player._money_buy(opsi)
		print("terbeli!")
	else:
		print("uang habis!")

func _on_kaki_1_pressed():
	_buy(kaki1)
func _on_kaki_2_pressed():
	_buy(kaki2)
func _on_kaki_3_pressed():
	_buy(kaki3)

func _on_tas_1_pressed():
	_buy(tas1)
func _on_tas_2_pressed():
	_buy(tas2)
func _on_tas_3_pressed():
	_buy(tas3)
