class_name GameMenu
extends CanvasLayer


signal new_game_started()

@onready var new_game : Button = %NewGame


func _ready() -> void:
    new_game.pressed.connect(start_new_game)


func start_new_game() -> void:
    new_game_started.emit()
