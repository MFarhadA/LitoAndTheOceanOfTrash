extends CharacterBody2D

@export var SPEED : float = 80.0
@export var distance : float = 30.0
@export var smooth_factor : float = 0.1

var player_position : Vector2
var target_position : Vector2
@onready var player = get_node("../Player")

func _physics_process(delta):
	
	if PlayerStats.tas1_equipped:
		$Sprite2D2.visible = true
		$Sprite2D.visible = false
	else:
		$Sprite2D2.visible = false
	if PlayerStats.tas2_equipped:
		$Sprite2D3.visible = true
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
	else:
		$Sprite2D3.visible = false
	if PlayerStats.tas3_equipped:
		$Sprite2D4.visible = true
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
		$Sprite2D3.visible = false
	else:
		$Sprite2D4.visible = false
	
	player_position = player.position
	
	var direction_to_player = (player_position - position).normalized()

	target_position = player_position - direction_to_player * distance
	
	if position.distance_to(player_position) > distance:
		position = position.lerp(target_position, smooth_factor)
		velocity = (target_position - position).normalized() * SPEED
		move_and_slide()
		
	if velocity.x < 0.3:
		$Sprite2D.flip_h = false
		$Sprite2D2.flip_h = false
		$Sprite2D3.flip_h = false
		$Sprite2D4.flip_h = false
	elif velocity.x > -0.3:
		$Sprite2D.flip_h = true
		$Sprite2D2.flip_h = true
		$Sprite2D3.flip_h = true
		$Sprite2D4.flip_h = true
