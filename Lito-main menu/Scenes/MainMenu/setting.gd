extends Control

var bgm = AudioServer. get_bus_index("music")
var sfx = AudioServer. get_bus_index("sfx")

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(bgm, value)
	if value == -30:
		AudioServer.set_bus_mute(bgm, true)
	else:
		AudioServer.set_bus_mute(bgm, false)

func _on_h_slider_2_value_changed(value):
	AudioServer.set_bus_volume_db(sfx, value)
	if value == -30:
		AudioServer.set_bus_mute(sfx, true)
	else:
		AudioServer.set_bus_mute(sfx, false)

func _on_back_button_pressed():
	Click.play()
	get_tree().paused = false
	queue_free()
