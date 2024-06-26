extends CharacterBody2D

class_name Player

@export var SPEED : float = 100.0
@export var GRAVITY : float = 800.0
@export var JUMP_FORCE : float = -200.0
@export var JUMP_FORCE_BORDER : float = -450.0
@export var SWIM_GRAVITY : float = 0.0001
@export var SWIM_VELOCITY_CAP : float = 50.0

@onready var money_display = $ControlMenu/Test/UI/coin_display

@export var dash_duration = 0.1

@export var Organic = 0
@export var Inorganic = 0
@export var Danger = 0

@onready var timer = $"."

var is_in_water : bool = false
var is_in_border : bool = false
var sinking : bool = true
var splash_played : bool = false
var SWIM_NORMAL_SPEED : float = PlayerStats.swim_speed

@onready var area_magnet = $ItemMagnet/itemmagnet
@onready var control = $ControlMenu
@onready var stamina = $ControlMenu/Test/UI/StaminaBar
@onready var dash = $Timer

func _ready():
	area_magnet.shape.radius *= PlayerStats.magnet_radius

func _physics_process(delta):
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	
	if is_in_water:
		if not splash_played:
			Splash.play()
			splash_played = true
		
		area_magnet.shape.radius *= 1
		if Input.is_action_just_pressed("Jump") and is_in_border:
			velocity.y += GRAVITY * delta
			velocity.y = JUMP_FORCE_BORDER
			$player.play("jump")
		
		if direction_x != 0:
			velocity.x = direction_x * PlayerStats.swim_speed
		else:
			velocity.x = move_toward(velocity.x, 0, PlayerStats.swim_speed)

		if sinking:
			if direction_y != 0:
				velocity.y = direction_y * PlayerStats.swim_speed
				sinking = false
			else:
				velocity.y = clamp(velocity.y + (GRAVITY * delta * SWIM_GRAVITY), -SWIM_VELOCITY_CAP, SWIM_VELOCITY_CAP)
		else:
			if direction_y == 0:
				velocity.y = move_toward(velocity.y, 0, PlayerStats.swim_speed)
				sinking = true
		
		if Input.is_action_just_pressed("Dash") and stamina.value > 0:
			Swim.play()
			dash.start_dash(dash_duration)
			stamina.value -= control.decrease_rate
			control.can_regen = false
			control.s_timer = 0
			PlayerStats.swim_speed = PlayerStats.dash_speed
		else:
			PlayerStats.swim_speed = SWIM_NORMAL_SPEED
			
			
		if direction_x != 0:
			$player.play("swim_side")
		else:
			$player.play("swim_idle")
		
		
	else:
		splash_played = false
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

	if direction_x > 0.3:
		$player.flip_h = false
	elif direction_x < -0.3:
		$player.flip_h = true

	move_and_slide()
	
func _process(delta):
	_money_label()

	
func _money_label():
	money_display.text = str(PlayerStats.money)
func _money_buy(buy):
	PlayerStats.money -= buy
	return PlayerStats.money

func organic_limit():
	return PlayerStats.OrganicLimit
func organic():
	return Organic
func add_organic(add):
	Organic += add
	return Organic
func move_organic(substract):
	Organic -= substract
	return Organic

func inorganic_limit():
	return PlayerStats.InorganicLimit
func inorganic():
	return Inorganic
func add_inorganic(add):
	Inorganic += add
	return Organic
func move_inorganic(substract):
	Inorganic -= substract
	return Organic

func danger_limit():
	return PlayerStats.DangerLimit
func danger():
	return Danger
func add_danger(add):
	Danger += add
	return Danger
func move_danger(substract):
	Danger -= substract
	return Organic

func _on_water_detection_2d_water_state_changed(is_in_water : bool):
	self.is_in_water = is_in_water

func _on_border_detection_2d_border_state_changed(is_in_border : bool):
	self.is_in_border = is_in_border
