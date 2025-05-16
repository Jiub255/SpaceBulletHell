class_name GameMenu
extends CanvasLayer


signal new_game_started()

@onready var new_game : Button = %NewGame
@onready var secret : Button = %Secret


func _ready() -> void:
    new_game.pressed.connect(start_new_game)
    CheatChecker.cheat_activated.connect(_handle_cheat_activation)


func start_new_game() -> void:
    new_game_started.emit()


func _handle_cheat_activation(effect : CheatChecker.Effect):
    if effect == CheatChecker.Effect.SECRET_MENU:
        secret.show()
