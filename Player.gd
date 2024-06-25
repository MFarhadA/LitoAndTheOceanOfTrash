extends CharacterBody2D

class_name Player

@export var SPEED : float = 100.0
@export var SWIM_SPEED : float = 50.0
@export var GRAVITY : float = 800.0
@export var JUMP_FORCE : float = -200.0
@export var JUMP_FORCE_BORDER : float = -450.0
@export var SWIM_JUMP : float = -100.0
@export var SWIM_GRAVITY : float = 0.001
@export var SWIM_VELOCITY_CAP : float = 100.0

@export var money = 100000
@onready var money_display = $ControlMenu/Test/UI/coin_display

@export var dash_speed = 2500
@export var dash_duration = 0.1

@export var OrganicLimit = 12
@export var Organic = 0
var OrganicDisplay = 0

@export var InorganicLimit= 50
@export var Inorganic = 0
var InorganicDisplay = 0

@export var DangerLimit = 30
@export var Danger = 0
var DangerDisplay = 0

@onready var timer = $"."

var is_in_water : bool = false
var is_in_border : bool = false
var sinking : bool = true
var SWIM_NORMAL_SPEED : float = 50.0

@onready var area_magnet = $ItemMagnet/itemmagnet
@onready var control = $ControlMenu
@onready var stamina = $ControlMenu/Test/UI/StaminaBar
@onready var dash = $Timer

func _ready():
	area_magnet.shape.radius *= 1

func _physics_process(delta):
	
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	
	if is_in_water:

		area_magnet.shape.radius *= 1
		if Input.is_action_just_pressed("Jump") and is_in_border:
			velocity.y += GRAVITY * delta
			velocity.y = JUMP_FORCE_BORDER
			$player.play("jump")
		
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
		
		if Input.is_action_just_pressed("Dash") and stamina.value > 0:
			dash.start_dash(dash_duration)
			stamina.value -= control.decrease_rate
			control.can_regen = false
			control.s_timer = 0
			SWIM_SPEED = dash_speed
		else:
			SWIM_SPEED = SWIM_NORMAL_SPEED
			
			
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
		

	if direction_x > 0.3:
		$player.flip_h = false
	elif direction_x < -0.3:
		$player.flip_h = true

	move_and_slide()
	
func _process(delta):
	_money_label()
	update_displays()
	
func _money():
	return money
func _money_label():
	$ControlMenu/Test/UI/coin_display.text = str(money)
func _money_buy(buy):
	money -= buy
	return money

func organic_limit():
	return OrganicLimit
func organic():
	return Organic
func organic_display():
	return OrganicDisplay
func add_organic(add):
	Organic += add
	update_displays()
	return Organic
func move_organic(substract):
	Organic -= substract
	update_displays()
	return Organic

func inorganic_limit():
	return InorganicLimit
func inorganic():
	return Inorganic
func inorganic_display():
	return InorganicDisplay
func add_inorganic(add):
	Inorganic += add
	update_displays()
	return Organic
func move_inorganic(substract):
	Inorganic -= substract
	update_displays()
	return Organic

func danger_limit():
	return DangerLimit
func danger():
	return Danger
func danger_display():
	return DangerDisplay
func add_danger(add):
	Danger += add
	update_displays()
	return Danger
func move_danger(substract):
	Danger -= substract
	update_displays()
	return Organic

func update_displays():
	OrganicDisplay = (Organic / float(OrganicLimit)) * 100
	InorganicDisplay = (Inorganic / float(InorganicLimit)) * 100
	DangerDisplay = (Danger / float(DangerLimit)) * 100

func _on_water_detection_2d_water_state_changed(is_in_water : bool):
	self.is_in_water = is_in_water

func _on_border_detection_2d_border_state_changed(is_in_border : bool):
	self.is_in_border = is_in_border
