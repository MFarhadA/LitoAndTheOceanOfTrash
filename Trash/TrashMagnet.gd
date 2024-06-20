extends CharacterBody2D

class_name Trash
var speed : float = 5000

@onready var player = $"."

func _physics_process(delta):
	if player == null:
		get_parent().get_nodes_in_group("Player")
	if player != null:
		velocity = position.direction_to(player.position) * speed
		move_and_slide()
