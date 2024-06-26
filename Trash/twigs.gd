extends Node2D

@onready var player = get_parent().get_node("Player")
var organic = 10

var getmagnet = false
var limit = false

var magnet_speed = 50.0
var player_position : Vector2
var target_position : Vector2

func _physics_process(delta):
	if player.organic_limit() >= player.organic() + organic:
		var bodies = $Area2D.get_overlapping_areas()
		for body in bodies:
				if body.name == "ItemMagnet":
					getmagnet = true
	if getmagnet:
		global_position += (player.position - global_position) / 5

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		if player.organic_limit() >= player.organic() + organic:
			player.add_organic(organic)
			print("ambil")
			queue_free()
		else:
			limit = true
			print("penuh")
