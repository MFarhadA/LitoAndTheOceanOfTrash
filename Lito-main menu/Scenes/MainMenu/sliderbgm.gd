extends HSlider

var bus_name = AudioServer. get_bus_index("Master")

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	connect("value_changed", self, "_on_value_changed")
	
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
