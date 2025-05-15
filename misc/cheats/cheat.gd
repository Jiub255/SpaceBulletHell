class_name Cheat
extends Resource
# TODO: Add timeout. Run process from whatever instantiates checker, through each of its cheats.

signal activated(effect : Enums.CheatEffect)


@export var _effect : Enums.CheatEffect
@export var _code : Array[Key]
var _head : int


func check(key : Key):
	print(f'head: {_head}, cheat key: {_code[_head]}, input key: {key}')
	if _code[_head] == key:
		_advance_head()
	else:
		_reset_head()


func _advance_head():
	_head += 1
	if _head == len(_code):
		_reset_head()
		activated.emit(_effect)


func _reset_head():
	_head = 0
