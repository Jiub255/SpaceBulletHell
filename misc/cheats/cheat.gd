class_name Cheat
extends Resource


signal activated(effect : CheatChecker.Effect)

const TIME_TO_TIMEOUT : float = 1.5

@export var _effect : CheatChecker.Effect
@export var _code : Array[Key]
var _heads : Array[int]
var _timer : float = 0.0


func tick(delta : float) -> void:
	_timer += delta


func check(key : Key) -> void:
	if _timer > TIME_TO_TIMEOUT:
		_heads = []
		#print(f'Timeout, resetting heads: {_heads}')
	_timer = 0.0
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


func _advance_head(head_index : int) -> void:
	_heads[head_index] += 1
	if _heads[head_index] == len(_code):
		_reset_head(head_index)
		activated.emit(_effect)
		#print(f'Cheat activated: {CheatChecker.Effect.keys()[_effect]}')


func _reset_head(head_index : int) -> void:
	_heads.remove_at(head_index)
