class_name Cheat
extends Resource
# TODO: Add timeout. Run process from whatever instantiates checker, through each of its cheats.


signal activated(effect : Enums.CheatEffect)

@export var _effect : Enums.CheatEffect
@export var _code : Array[Key]
var _heads : Array[int]


func check(key : Key):
	# Start a new head at 0 each check.
	_heads.append(0)
	# Iterating backwards because of potential array deletions.
	for i in range(len(_heads) - 1, -1, -1):
		var head = _heads[i]
		#print(f'head: {head}, cheat key: {_code[head]}, input key: {key}')
		if _code[head] == key:
			_advance_head(i)
		else:
			_reset_head(i)
	#print(f'head count: {len(_heads)}')


func _advance_head(head_index : int):
	_heads[head_index] += 1
	if _heads[head_index] == len(_code):
		_reset_head(head_index)
		activated.emit(_effect)
		#print(f'Cheat activated: {_effect}')


func _reset_head(head_index : int):
	_heads.remove_at(head_index)
