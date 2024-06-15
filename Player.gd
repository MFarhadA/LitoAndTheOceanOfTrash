extends CharacterBody2D

@export var SPEED : float = 100.0
@export var SWIM_SPEED : float = 100.0
@export var GRAVITY : float = 800.0
@export var JUMP_FORCE : float = -200.0
@export var JUMP_FORCE_BORDER : float = -450.0
@export var SWIM_JUMP : float = -100.0
@export var SWIM_GRAVITY : float = 0.0001
@export var SWIM_VELOCITY_CAP : float = 100.0

var is_in_water : bool = false
var is_in_border : bool = false
var sinking : bool = true

func _physics_process(delta):
	# print("y=" + str(velocity.y) + ", x=" + str(velocity.x))
	
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")

	if is_in_water:
		
		if Input.is_action_just_pressed("Jump") and is_in_border:
			velocity.y += GRAVITY * delta
			velocity.y = JUMP_FORCE_BORDER
			$player.play("jump")
			print("waterjump")
		
		if direction_x != 0:
			velocity.x = direction_x * SWIM_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SWIM_SPEED)

		if sinking:
			if direction_y != 0:
				velocity.y = direction_y * SWIM_SPEED
				sinking = false
			else:
				velocity.y = clamp(velocity.y + (GRAVITY * delta * SWIM_GRAVITY), -SWIM_VELOCITY_CAP, SWIM_VELOCITY_CAP)
		else:
			if direction_y == 0:
				velocity.y = move_toward(velocity.y, 0, SWIM_SPEED)
				sinking = true
				
		if direction_x != 0:
			$player.play("swim_side")
		else:
			$player.play("swim_idle")
		
	else:
		sinking = true
		if direction_x != 0:
			velocity.x = direction_x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		if is_on_floor():
			if direction_x != 0:
				$player.play("walk")
			else:
				$player.play("idle")
		else:
			velocity.y += GRAVITY * delta

		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_FORCE
			$player.play("jump")
			print("jump")

	if direction_x == 1:
		$player.flip_h = false
	elif direction_x == -1:
		$player.flip_h = true

	move_and_slide()

func _on_water_detection_2d_water_state_changed(is_in_water : bool):
	self.is_in_water = is_in_water

func _on_border_detection_2d_border_state_changed(is_in_border : bool):
	self.is_in_border = is_in_border
	print(is_in_border)
