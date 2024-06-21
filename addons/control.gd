extends Control

@onready var stamina = $Test/UI/StaminaBar
var can_regen = false
var time_to_wait = 1.0
var regen
var s_timer = 0
var can_start_timer = true
var decrease_rate = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	stamina.value = stamina.max_value
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_regen == false && stamina.value != 100 or stamina.value == 0:
		can_start_timer = true
		if can_start_timer:
			s_timer += delta
			if s_timer >= time_to_wait:
				can_regen = true
				can_start_timer = false
				s_timer = 0

	if stamina.value == 100:
		can_regen = false
	if can_regen == true:
		stamina.value += 0.5
		can_start_timer = false
		s_timer = 0
	
	if stamina.value < 0:
		stamina.value = 0
	if stamina.value > stamina.max_value:
		stamina.value = stamina.max_value
	
	if Input.is_action_just_pressed("Dash"):
		stamina.value -= decrease_rate * delta
		can_regen = false
		s_timer = 0
