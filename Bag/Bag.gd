extends CharacterBody2D

@export var SPEED : float = 80.0
@export var distance : float = 30.0
@export var smooth_factor : float = 0.1

var player_position : Vector2
var target_position : Vector2
@onready var player = get_node("../Player")

func _physics_process(delta):
	player_position = player.position
	
	var direction_to_player = (player_position - position).normalized()

	target_position = player_position - direction_to_player * distance
	
	if position.distance_to(player_position) > distance:
		position = position.lerp(target_position, smooth_factor)
		velocity = (target_position - position).normalized() * SPEED
		move_and_slide()
