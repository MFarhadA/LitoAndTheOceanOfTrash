extends ParallaxLayer

var scrolling_speed = 100

func _process(delta):
	self.motion_offset.x -= scrolling_speed * delta
