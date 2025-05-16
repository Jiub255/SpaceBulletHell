class_name Cheat
extends Resource


signal activated(effect : CheatChecker.Effect)

const TIMEOUT_LIMIT : float = 1.5

@export var _effect : CheatChecker.Effect
@export var _code : Array[Key]
var _heads : Array[int]
var _timer : float = 0.0


func tick(delta : float) -> void:
	_timer += delta


func check(input_key : Key) -> void:
	if _timer > TIMEOUT_LIMIT:
		_heads.clear()
	_timer = 0.0
	_create_new_head()
	# Iterating backwards because of potential array deletions.
	for i in range(len(_heads) - 1, -1, -1):
		var cheat_key = _code[_heads[i]]
		if cheat_key == input_key:
			_advance_head(i)
		else:
			_delete_head(i)


func _create_new_head() -> void:
	_heads.append(0)


func _advance_head(head_index : int) -> void:
	_heads[head_index] += 1
	if _heads[head_index] == len(_code):
		_delete_head(head_index)
		activated.emit(_effect)


func _delete_head(head_index : int) -> void:
	_heads.remove_at(head_index)
