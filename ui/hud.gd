extends CanvasLayer


@onready var _parts : Label = %Parts
@onready var _health : Label = %Health


func set_parts(parts : int) -> void:
    _parts.text = f'Parts: {parts}'


func set_health(health : int) -> void:
    _health.text = f'Health: {health}'
