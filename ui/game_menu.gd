class_name GameMenu
extends Menu


signal new_game_started()

@onready var _new_game : Button = %NewGame
@onready var _kool_stuff : Button = %KoolStuff
@onready var _kooler_stuff : Button = %KoolerStuff
@onready var _scotts_stuff : Button = %ScottsStuff


func _ready() -> void:
    _new_game.pressed.connect(start_new_game)
    CheatChecker.cheat_activated.connect(_handle_cheat_activation)


func start_new_game() -> void:
    new_game_started.emit()


func _handle_cheat_activation(effect : CheatChecker.Effect) -> void:
    if effect == CheatChecker.Effect.KOOL_STUFF:
        _kool_stuff.show()
    elif effect == CheatChecker.Effect.KOOLER_STUFF:
        _kooler_stuff.show()
    elif effect == CheatChecker.Effect.SCOTTS_STUFF:
        _scotts_stuff.show()
