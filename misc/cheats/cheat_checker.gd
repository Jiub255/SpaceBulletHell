extends Node

signal cheat_activated(effect : Effect)

enum Effect{
	KOOL_STUFF,
	KOOLER_STUFF,
	SCOTTS_STUFF,
}

var cheats : Array[Cheat]


func _ready() -> void:
	var kool_stuff : Cheat = load('uid://c1c4n7g7jlr8d')
	var kooler_stuff : Cheat = load('uid://bdpmyu8x8blm3')
	var scotts_stuff : Cheat = load('uid://gd3oibfw20q')

	cheats.append(kool_stuff)
	cheats.append(kooler_stuff)
	cheats.append(scotts_stuff)

	for cheat in cheats:
		cheat.activated.connect(cheat_activated.emit)


func _process(delta : float) -> void:
	for cheat in cheats:
		cheat.tick(delta)


func _input(event : InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		for cheat in cheats:
			cheat.check(event.keycode)
