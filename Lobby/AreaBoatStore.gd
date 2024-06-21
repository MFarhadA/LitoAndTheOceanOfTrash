extends Area2D

@onready var BoatStore = $BoatStore


func _ready():
	BoatStore.visible = false
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		BoatStore.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		BoatStore.visible = false
