extends CharacterBody2D

@export var SPEED : float = 100.0
@export var distance : float = 25.0
var player_position : Vector2
var target_position : Vector2
@onready var player = get_node("../Player")

func _physics_process(delta):
	player_position = player.position
	
	var direction_to_player = (player_position - position).normalized()

	target_position = player_position - direction_to_player * distance
	
	if position.distance_to(player_position) > distance:
		velocity = (target_position - position).normalized() * SPEED
		move_and_slide()
