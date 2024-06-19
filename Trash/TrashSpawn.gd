extends Node2D

var organic1 = preload("res://Trash/twigs.tscn")
var organic2 = preload("res://Trash/palm_leaf.tscn")
var inorganic1 = preload("res://Trash/plastic_bottle.tscn")
var inorganic2 = preload("res://Trash/opened_can.tscn")
var danger1 = preload("res://Trash/battery.tscn")
var danger2 = preload("res://Trash/accu_battery.tscn")

func _ready():
	randomize()
	var trashes = [organic1, organic2, inorganic1, inorganic2, danger1, danger2]
	var kinds = trashes[randi()% trashes.size]
	var trash = kinds.instance()
	trash.position = Vector2(rand_range(25, 1735), rand_range(375, 1075))
	add_child(trash)

func _process(delta):
	pass
