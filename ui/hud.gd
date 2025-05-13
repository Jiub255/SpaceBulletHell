extends CanvasLayer


@onready var _credits : Label = %Credits


func set_credits(credits : int):
    _credits.text = f'Credits: {credits}'
