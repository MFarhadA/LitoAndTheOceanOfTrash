extends CharacterBody2D

@export var SPEED : int = 155
@export var GRAVITY : int = 900
@export var JUMP_FORCE : int = 255

func _physics_process(delta):
	var was_on_floor = false
	
	print("y=" + str(velocity.y) + ", x=" + str(velocity.x))
	
	var direction = Input.get_axis("Left", "Right")
	
	if direction and is_on_floor():
		velocity.x = direction * SPEED
		$player.play("walk")
		
	elif is_on_floor():
		velocity.x = 0
		$player.play("idle")
	
	if direction == 1:
		$player.flip_h = false

	elif direction == -1:
		$player.flip_h = true
	
	
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		if was_on_floor:
			$player.play("fall")
			print("fall")
	else:
		was_on_floor = true
		
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= JUMP_FORCE
		$player.play("jump")
		print("jump")
	
	move_and_slide()
