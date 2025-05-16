class_name HUD
extends CanvasLayer


var _game_state : GameState
@onready var _parts : Label = %Parts
@onready var _health : Label = %Health


func setup(game_state : GameState):
    _game_state = game_state
    _game_state.parts_changed.connect(_set_parts)
    _set_parts(_game_state.parts)


func _set_parts(parts : int) -> void:
    _parts.text = f'Parts: {parts}'


func set_health(health : int) -> void:
    _health.text = f'Health: {health}'
