extends Control
	
func _on_back_button_pressed():
	get_tree().paused = false
	queue_free()
