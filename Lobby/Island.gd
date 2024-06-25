extends Area2D

var is_go

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		is_go = true

func _on_body_exited(body):
	if body.name == "Player":
		is_go = false

func _is_go():
	return is_go
