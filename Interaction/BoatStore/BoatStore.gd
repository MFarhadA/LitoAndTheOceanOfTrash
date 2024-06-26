extends CanvasLayer

var bought

func _ready():
	if BoatStats.ship1_equipped:
		$TabContainer/Perahu/control/Panel/lvl1.visible = false
	if BoatStats.ship2_equipped:
		$TabContainer/Perahu/control/Panel/lvl1.visible = false
		$TabContainer/Perahu/control/Panel2/lvl2.visible = false
	if BoatStats.ship3_equipped:
		$TabContainer/Perahu/control/Panel/lvl1.visible = false
		$TabContainer/Perahu/control/Panel2/lvl2.visible = false
		$TabContainer/Perahu/control/Panel3/lvl3.visible = false

func _on_cancel_pressed():
	PlayerStats.save()
	BoatStats.save()
	Click.play()
	get_tree().paused = false
	visible = false

func _buy(opsi):
	if PlayerStats.money >= opsi:
		Coin.play()
		PlayerStats.money -= opsi
		bought = true
	else:
		Pop.play()
		print("uang habis!")
		bought = false

func _on_lvl_1_pressed():
	_buy(500)
	if bought:
		BoatStats.ship1_equipped = true
	if BoatStats.ship1_equipped:
		BoatStats.OrganicLimit = 250
		BoatStats.InorganicLimit = 200
		BoatStats.DangerLimit = 150
		$TabContainer/Perahu/control/Panel/lvl1.visible = false

func _on_lvl_2_pressed():
	_buy(2000)
	if bought:
		BoatStats.ship2_equipped = true
	if BoatStats.ship2_equipped:
		BoatStats.OrganicLimit = 500
		BoatStats.InorganicLimit = 400
		BoatStats.DangerLimit = 300
		$TabContainer/Perahu/control/Panel/lvl1.visible = false
		$TabContainer/Perahu/control/Panel2/lvl2.visible = false
	
func _on_lvl_3_pressed():
	_buy(5000)
	if bought:
		BoatStats.ship3_equipped = true
	if BoatStats.ship3_equipped:
		BoatStats.OrganicLimit = 1000
		BoatStats.InorganicLimit = 800
		BoatStats.DangerLimit = 750
		$TabContainer/Perahu/control/Panel/lvl1.visible = false
		$TabContainer/Perahu/control/Panel2/lvl2.visible = false
		$TabContainer/Perahu/control/Panel3/lvl3.visible = false
