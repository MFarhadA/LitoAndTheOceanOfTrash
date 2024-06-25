extends Area2D

var is_in_boat_store = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		is_in_boat_store = true

func _on_body_exited(body):
	if body.name == "Player":
		is_in_boat_store = false

func _is_in_boat_store():
	return is_in_boat_store
