extends Button


func _on_pressed():
	PlayerStats.save()
	BoatStats.save()
	Click.play()
