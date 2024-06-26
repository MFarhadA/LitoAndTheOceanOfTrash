extends Node2D

@onready var interact = $Boat/CanvasLayer/Interact
@onready var diving_shop = $AreaDivingShop
@onready var diving_shop_menu = $AreaDivingShop/DivingShop
@onready var boat_store = $AreaBoatStore
@onready var boat_store_menu = $AreaBoatStore/BoatStore
@onready var trash_store = $AreaTrashStore
@onready var trash_store_menu = $AreaTrashStore/TrashStore
@onready var island = $Island
@onready var go_island = $Island/Island

func _ready():
	Bgm.play_music_level()
	interact.visible = false
	diving_shop_menu.visible = false
	boat_store_menu.visible = false
	trash_store_menu.visible = false

func _physics_process(delta):
	if diving_shop._is_in_diving_shop() or boat_store._is_in_boat_store() or trash_store._is_in_trash_store() or island._is_go():
		interact.visible = true
	else:
		interact.visible = false

func _on_interact_pressed():
	Click.play()
	get_tree().paused = true
	if diving_shop._is_in_diving_shop():
		diving_shop_menu.visible = true
		interact.visible = false
	if boat_store._is_in_boat_store():
		boat_store_menu.visible = true
		interact.visible = false
	if trash_store._is_in_trash_store():
		trash_store_menu.visible = true
		interact.visible = false
	if island._is_go():
		go_island.visible = true
		interact.visible = false
