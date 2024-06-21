extends Area2D

signal border_state_changed(is_in_border : bool)

var is_in_border : bool = false;



func _on_body_entered(CollisionShape2D3):
	var overlapping_bodies = get_overlapping_bodies()
	if overlapping_bodies.size() > 0 and not is_in_border:
		is_in_border = true
		emit_signal("border_state_changed", is_in_border)


func _on_body_exited(CollisionShape2D3):
	var overlapping_bodies = get_overlapping_bodies()
	if (overlapping_bodies.size() == 0):
		is_in_border = false
		emit_signal("border_state_changed", is_in_border)
