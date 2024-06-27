extends Node

var save_path = "user://player.json"

var money = 0

var swim_speed : float = 50.0
var dash_speed = 2500
var magnet_radius = 1

var OrganicLimit = 50
var InorganicLimit = 50
var DangerLimit = 30

var kaki1_equipped = false
var kaki2_equipped = false
var kaki3_equipped = false

var tas1_equipped = false
var tas2_equipped = false
var tas3_equipped = false

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(money)
	file.store_var(swim_speed)
	file.store_var(dash_speed)
	file.store_var(magnet_radius)
	file.store_var(OrganicLimit)
	file.store_var(InorganicLimit)
	file.store_var(DangerLimit)
	file.store_var(kaki1_equipped)
	file.store_var(kaki2_equipped)
	file.store_var(kaki3_equipped)
	file.store_var(tas1_equipped)
	file.store_var(tas2_equipped)
	file.store_var(tas3_equipped)
	file.close()
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		money = file.get_var(money)
		swim_speed = file.get_var(swim_speed)
		dash_speed = file.get_var(dash_speed)
		magnet_radius = file.get_var(magnet_radius)
		OrganicLimit = file.get_var(OrganicLimit)
		InorganicLimit = file.get_var(InorganicLimit)
		DangerLimit = file.get_var(DangerLimit)
		kaki1_equipped = file.get_var(kaki1_equipped)
		kaki2_equipped = file.get_var(kaki2_equipped)
		kaki3_equipped = file.get_var(kaki3_equipped)
		tas1_equipped = file.get_var(tas1_equipped)
		tas2_equipped = file.get_var(tas2_equipped)
		tas3_equipped = file.get_var(tas3_equipped)
		file.close()
	else:
		print("no data.")
