extends Area2D

@onready var TrashMove = $"../../Player/UI/trashmove"
@onready var back = $"../../Player/UI/back"
var is_in = false
var _is_in = is_in_boat()

func _ready():
	TrashMove.visible = false
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		TrashMove.visible = true
		back.visible = true
		_is_in = true

func _on_body_exited(body):
	if body.name == "Player":
		TrashMove.visible = false
		back.visible = false
		_is_in = false


func is_in_boat() -> bool:
	return is_in
