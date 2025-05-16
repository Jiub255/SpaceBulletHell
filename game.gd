extends Node


var _level : Level
var _level_scene : PackedScene = load(UIDs.TEST_LEVEL)
var _game_state : GameState
@onready var _ui : UiManager = %UiManager


func _ready() -> void:
    _ui.toggle_pause.connect(_toggle_pause)
    _ui.new_game_started.connect(_start_new_game)


func _start_new_game() -> void:
    _game_state = GameState.new()
    # TODO: Instantiate/Setup level
    _ui.setup(_game_state)
    _level = _level_scene.instantiate() as Level
    add_child(_level)
    _level.health_changed.connect(_ui.hud.set_health)
    _level.start_level(_game_state)


func _toggle_pause(pause : bool) -> void:
    if _level:
        if pause:
            _level.process_mode = Node.PROCESS_MODE_DISABLED
        else:
            _level.process_mode = Node.PROCESS_MODE_INHERIT
