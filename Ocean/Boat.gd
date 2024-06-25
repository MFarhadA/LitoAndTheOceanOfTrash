extends CharacterBody2D

@export var OrganicLimit = 50
@export var Organic = 0
var OrganicDisplay = 0

@export var InorganicLimit= 50
@export var Inorganic = 0
var InorganicDisplay = 0

@export var DangerLimit = 30
@export var Danger = 0
var DangerDisplay = 0

@onready var player = get_parent().get_node("Player")
@onready var organic_label = $OrganicLabel
@onready var inorganic_label = $InorganicLabel
@onready var danger_label = $DangerLabel

func _process(delta):
	update_organic_label()
	update_inorganic_label()
	update_danger_label()

func organic_limit():
	return OrganicLimit
func organic():
	return Organic
func organic_display():
	return OrganicDisplay
func add_organic(add):
	Organic += add
	OrganicDisplay = (Organic / OrganicLimit) * 100
	return Organic

func inorganic_limit():
	return InorganicLimit
func inorganic():
	return Inorganic
func inorganic_display():
	return InorganicDisplay
func add_inorganic(add):
	Inorganic += add
	InorganicDisplay = (Inorganic / InorganicLimit) * 100
	return Organic

func danger_limit():
	return DangerLimit
func danger():
	return Danger
func danger_display():
	return DangerDisplay
func add_danger(add):
	Danger += add
	DangerDisplay = (Danger / DangerLimit) * 100
	return Danger

func update_organic_label():
	organic_label.text = "Organik\n" + "(" + str(Organic) + "/" + str(OrganicLimit) + ")"
	if Organic == OrganicLimit:
		organic_label.text += "\nPENUH!"

func update_inorganic_label():
	inorganic_label.text = "Inorganik\n" + "(" + str(Inorganic) + "/" + str(OrganicLimit) + ")"
	if Inorganic == player.inorganic_limit():
		inorganic_label.text += "\nPENUH!"

func update_danger_label():
	danger_label.text = "B3\n" + "(" + str(Danger) + "/" + str(DangerLimit) + ")"
	if Danger == DangerLimit:
		danger_label.text += "\nPENUH!"

func _on_trashmove_pressed():
	add_organic(player.organic())
	player.move_organic(player.organic())
	add_inorganic(player.inorganic())
	player.move_inorganic(player.inorganic())
	add_danger(player.danger())
	player.move_danger(player.danger())
	print("moved")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Lobby/Lobby.tscn")
