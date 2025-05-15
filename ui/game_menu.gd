class_name GameMenu
extends CanvasLayer


signal new_game_started()

var cheat_checker : CheatChecker
@onready var new_game : Button = %NewGame
@onready var secret : Button = %Secret


func _input(event):
    cheat_checker.check_input(event)


func _ready() -> void:
    new_game.pressed.connect(start_new_game)
    cheat_checker = CheatChecker.new()
    cheat_checker.setup()
    cheat_checker.cheat_activated.connect(_handle_cheat_activation)


func start_new_game() -> void:
    new_game_started.emit()


func _handle_cheat_activation(effect : Enums.CheatEffect):
    if effect == Enums.CheatEffect.SECRET_MENU:
        secret.show()
