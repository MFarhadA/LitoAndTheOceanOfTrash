extends CanvasLayer

func _on_cancel_pressed():
	Click.play()
	get_tree().paused = false
	visible = false

func _on_pergi_pressed():
	Pop.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Ocean/Ocean.tscn")
