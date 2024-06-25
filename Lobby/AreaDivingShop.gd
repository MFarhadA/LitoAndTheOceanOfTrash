extends Area2D

var is_in_diving_shop = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		is_in_diving_shop = true

func _on_body_exited(body):
	if body.name == "Player":
		is_in_diving_shop = false

func _is_in_diving_shop():
	return is_in_diving_shop
