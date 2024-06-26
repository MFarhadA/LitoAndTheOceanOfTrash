extends CharacterBody2D

var OrganicTemp = 0
var InorganicTemp = 0
var DangerTemp = 0

@onready var player = get_parent().get_node("Player")
@onready var organic_label = $OrganicLabel
@onready var inorganic_label = $InorganicLabel
@onready var danger_label = $DangerLabel

func _process(delta):
	update_organic_label()
	update_inorganic_label()
	update_danger_label()

func organic_limit():
	return BoatStats.OrganicLimit
func organic():
	return BoatStats.Organic
func add_organic(add):
	if BoatStats.Organic + add <= BoatStats.OrganicLimit:
		BoatStats.Organic += add
	else:
		BoatStats.Organic = BoatStats.OrganicLimit
	return BoatStats.Organic
func move_organic(move):
	if BoatStats.Organic + move < BoatStats.OrganicLimit:
		OrganicTemp = move
	else:
		OrganicTemp = move - ((BoatStats.Organic + move) - BoatStats.OrganicLimit)
	return OrganicTemp

func inorganic_limit():
	return BoatStats.InorganicLimit
func inorganic():
	return BoatStats.Inorganic
func add_inorganic(add):
	if BoatStats.Inorganic + add <= BoatStats.InorganicLimit:
		BoatStats.Inorganic += add
	else:
		BoatStats.Inorganic = BoatStats.InorganicLimit
	return BoatStats.Inorganic
func move_inorganic(move):
	if BoatStats.Inorganic + move < BoatStats.InorganicLimit:
		InorganicTemp = move
	else:
		InorganicTemp = move - ((BoatStats.Inorganic + move) - BoatStats.InorganicLimit)
	return InorganicTemp

func danger_limit():
	return BoatStats.DangerLimit
func danger():
	return BoatStats.Danger
func add_danger(add):
	if BoatStats.Danger + add <= BoatStats.DangerLimit:
		BoatStats.Danger += add
	else:
		BoatStats.Danger = BoatStats.DangerLimit
	return BoatStats.Danger
func move_danger(move):
	if BoatStats.Danger + move < BoatStats.DangerLimit:
		DangerTemp = move
	else:
		DangerTemp = move - ((BoatStats.Danger + move) - BoatStats.DangerLimit)
	return DangerTemp

func update_organic_label():
	organic_label.text = "Organik\n" + "(" + str(BoatStats.Organic) + "/" + str(BoatStats.OrganicLimit) + ")"
	if BoatStats.Organic == BoatStats.OrganicLimit:
		organic_label.text += "\nPENUH!"
func update_inorganic_label():
	inorganic_label.text = "Inorganik\n" + "(" + str(BoatStats.Inorganic) + "/" + str(BoatStats.InorganicLimit) + ")"
	if BoatStats.Inorganic == BoatStats.InorganicLimit:
		inorganic_label.text += "\nPENUH!"
func update_danger_label():
	danger_label.text = "B3\n" + "(" + str(BoatStats.Danger) + "/" + str(BoatStats.DangerLimit) + ")"
	if BoatStats.Danger == BoatStats.DangerLimit:
		danger_label.text += "\nPENUH!"

func _input(event):
	if event.is_action_pressed("Interact"):
		_on_trashmove_pressed()

func _on_trashmove_pressed():
	Click.play()
	move_organic(player.organic())
	add_organic(player.organic())
	player.move_organic(OrganicTemp)
	
	move_inorganic(player.inorganic())
	add_inorganic(player.inorganic())
	player.move_inorganic(InorganicTemp)
	
	move_danger(player.danger())
	add_danger(player.danger())
	player.move_danger(DangerTemp)

func _on_back_pressed():
	PlayerStats.save()
	BoatStats.save()
	Pop.play()
	get_tree().change_scene_to_file("res://Lobby/Lobby.tscn")
