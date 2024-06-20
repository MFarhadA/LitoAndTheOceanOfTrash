extends Node2D

var organic1 = preload("res://Trash/twigs.tscn")
var organic2 = preload("res://Trash/palm_leaf.tscn")
var inorganic1 = preload("res://Trash/plastic_bottle.tscn")
var inorganic2 = preload("res://Trash/opened_can.tscn")
var danger1 = preload("res://Trash/battery.tscn")
var danger2 = preload("res://Trash/accu_battery.tscn")

var spawn : bool = true

func _ready():
	if spawn:
		spawn_trash()

func spawn_trash():
	randomize()
	var organics = [organic1, organic2]
	var inorganics = [inorganic1, inorganic2]
	var dangers = [danger1, danger2]
	
	for i in range(20):
		var kinds = organics[randi() % organics.size()]
		var trash = kinds.instantiate()
		trash.position = Vector2(randf_range(25, 1735), randf_range(375, 1075))
		trash.rotation = randf_range(0, PI * 2)
		add_child(trash)
		trash.add_to_group("trash_group")
	
	for i in range(10):
		var kinds = inorganics[randi() % inorganics.size()]
		var trash = kinds.instantiate()
		trash.position = Vector2(randf_range(25, 1735), randf_range(375, 1075))
		trash.rotation = randf_range(0, PI * 2)
		add_child(trash)
		trash.add_to_group("trash_group")
		
	for i in range(10):
		var kinds = dangers[randi() % dangers.size()]
		var trash = kinds.instantiate()
		trash.position = Vector2(randf_range(25, 1735), randf_range(375, 1075))
		trash.rotation = randf_range(0, PI * 2)
		add_child(trash)
		trash.add_to_group("trash_group")

func respawn_trash():
	for trash in get_tree().get_nodes_in_group("trash_group"):
		trash.queue_free()

func trigger_respawn():
	spawn = true
	respawn_trash()

func _process(delta):
	pass
