extends Area2D

var getmagnet = false
@onready var player = get_parent().get_node("../Player")
var magnet_speed = 50.0
var player_position : Vector2
var target_position : Vector2

func _physics_process(delta):
	var bodies = get_overlapping_areas()
	for body in bodies:
		if body.name == "ItemMagnet":
			getmagnet = true
	if getmagnet:
		global_position += (player.position - global_position) / 10
