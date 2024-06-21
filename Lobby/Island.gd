extends Area2D

@onready var Island = $Island


func _ready():
	Island.visible = false
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		Island.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		Island.visible = false
