extends Control


@export var action_jump := "jump"

func _input(event):
	if Input.is_action_just_pressed(Jump)
