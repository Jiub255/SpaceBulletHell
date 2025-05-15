class_name CheatChecker


signal cheat_activated(effect : Enums.CheatEffect)

var cheats : Array[Cheat]


func check_input(event):
	if event is InputEventKey and event.pressed:
		for cheat in cheats:
			cheat.check(event.keycode)


func setup():
	var secret_menu : Cheat = load('uid://c1c4n7g7jlr8d')
	var test_cheat_2 : Cheat = load('uid://bdpmyu8x8blm3')
	var test_cheat_3 : Cheat = load('uid://gd3oibfw20q')

	cheats.append(secret_menu)
	cheats.append(test_cheat_2)
	cheats.append(test_cheat_3)

	for cheat in cheats:
		cheat.activated.connect(cheat_activated.emit)
