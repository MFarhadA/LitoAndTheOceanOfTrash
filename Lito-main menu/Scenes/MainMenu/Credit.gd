extends Control

func _on_back_button_pressed():
	Click.play()
	queue_free()
