extends ParallaxLayer

@export var border_speed : float = 10

func _process(delta) -> void:
	self.motion_offset.x += border_speed *delta
