extends Node

var save_path = "res://boat.save"

var Organic = 0
var Inorganic = 0
var Danger = 0

var OrganicLimit = 100
var InorganicLimit = 70
var DangerLimit = 50

var ship1_equipped = false
var ship2_equipped = false
var ship3_equipped = false

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Organic)
	file.store_var(Inorganic)
	file.store_var(Danger)
	file.store_var(OrganicLimit)
	file.store_var(InorganicLimit)
	file.store_var(DangerLimit)
	file.store_var(ship1_equipped)
	file.store_var(ship2_equipped)
	file.store_var(ship3_equipped)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Organic = file.get_var(Organic)
		Inorganic = file.get_var(Inorganic)
		Danger = file.get_var(Danger)
		OrganicLimit = file.get_var(OrganicLimit)
		InorganicLimit = file.get_var(InorganicLimit)
		DangerLimit = file.get_var(DangerLimit)
		ship1_equipped = file.get_var(ship1_equipped)
		ship2_equipped = file.get_var(ship2_equipped)
		ship3_equipped = file.get_var(ship3_equipped)
	else:
		print("no data.")
