extends CanvasLayer

var bought

func _ready():
	$"Control/TabContainer/Kaki Katak/Panel/kaki1".visible = false
	$"Control/TabContainer/Kaki Katak/Panel2/kaki2".visible = false
	$"Control/TabContainer/Kaki Katak/Panel3/kaki3".visible = false

func _on_cancel_pressed():
	Click.play()
	get_tree().paused = false
	visible = false

func _buy(opsi):
	if PlayerStats.money >= opsi:
		Coin.play()
		PlayerStats.money -= opsi
		print("terbeli!")
		bought = true
	else:
		Pop.play()
		bought = false
		print("UANG TIDAK CUKUP")

func _on_kaki_1_pressed():
	_buy(500)
	if bought:
		PlayerStats.kaki1_equipped = true
	if PlayerStats.kaki1_equipped:
		PlayerStats.swim_speed = 100
		PlayerStats.dash_speed = 2500
		$"Control/TabContainer/Kaki Katak/Panel/kaki1".visible = false
func _on_kaki_2_pressed():
	_buy(2000)
	if bought:
		PlayerStats.kaki2_equipped = true
	if PlayerStats.kaki2_equipped:
		PlayerStats.swim_speed = 150
		PlayerStats.dash_speed = 3500
		$"Control/TabContainer/Kaki Katak/Panel/kaki1".visible = false
		$"Control/TabContainer/Kaki Katak/Panel2/kaki2".visible = false
func _on_kaki_3_pressed():
	_buy(5000)
	if bought:
		PlayerStats.kaki3_equipped = true
	if PlayerStats.kaki3_equipped:
		PlayerStats.swim_speed = 200
		PlayerStats.dash_speed = 5000
		$"Control/TabContainer/Kaki Katak/Panel/kaki1".visible = false
		$"Control/TabContainer/Kaki Katak/Panel2/kaki2".visible = false
		$"Control/TabContainer/Kaki Katak/Panel3/kaki3".visible = false

func _on_tas_1_pressed():
	_buy(500)
	if bought:
		PlayerStats.tas1_equipped = true
	if PlayerStats.tas1_equipped:
		PlayerStats.OrganicLimit = 100
		PlayerStats.InorganicLimit = 100
		PlayerStats.DangerLimit = 60
		PlayerStats.magnet_radius = 1.1
		$Control/TabContainer/Tas/Panel/tas1.visible = false
func _on_tas_2_pressed():
	_buy(2000)
	if bought:
		PlayerStats.tas2_equipped = true
	if PlayerStats.tas2_equipped:
		PlayerStats.OrganicLimit = 200
		PlayerStats.InorganicLimit = 200
		PlayerStats.DangerLimit = 120
		PlayerStats.magnet_radius = 1.5
		$Control/TabContainer/Tas/Panel/tas1.visible = false
		$Control/TabContainer/Tas/Panel2/tas2.visible = false
func _on_tas_3_pressed():
	_buy(5000)
	if bought:
		PlayerStats.tas3_equipped = true
	if PlayerStats.tas3_equipped:
		PlayerStats.OrganicLimit = 300
		PlayerStats.InorganicLimit = 300
		PlayerStats.DangerLimit = 200
		PlayerStats.magnet_radius = 2
		$Control/TabContainer/Tas/Panel/tas1.visible = false
		$Control/TabContainer/Tas/Panel2/tas2.visible = false
		$Control/TabContainer/Tas/Panel3/tas3.visible = false
