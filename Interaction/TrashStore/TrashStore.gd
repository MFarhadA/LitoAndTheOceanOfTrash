extends CanvasLayer


func _on_cancel_pressed():
	Click.play()
	get_tree().paused = false
	visible = false


func _on_button_pressed():
	Coin.play()
	PlayerStats.money += (BoatStats.Organic) + (BoatStats.Inorganic * 2) + (BoatStats.Danger * 3)
	BoatStats.Organic = 0
	BoatStats.Inorganic = 0
	BoatStats.Danger = 0
	get_tree().paused = false
	visible = false
