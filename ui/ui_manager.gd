class_name UiManager
extends Node


signal toggle_pause(pause : bool)
signal new_game_started()

var _menus_open : int:
    set(value):
        _menus_open = value
        if _menus_open == 0:
            toggle_pause.emit(false)
        else:
            toggle_pause.emit(true)

@onready var hud : HUD = %HUD
@onready var game_menu : GameMenu = %GameMenu
@onready var ship_menu : ShipMenu = %ShipMenu


func _ready() -> void:
    game_menu.new_game_started.connect(_start_new_game)


func _physics_process(_delta: float) -> void:
    if Input.is_action_just_pressed(InputNames.GAME_MENU):
        _toggle_menu(game_menu)
    elif not game_menu.visible and Input.is_action_just_pressed(InputNames.SHIP_MENU):
        _toggle_menu(ship_menu)


func _toggle_menu(menu : CanvasLayer) -> void:
    if menu.visible:
        menu.hide()
        _menus_open -= 1
    else:
        menu.show()
        _menus_open += 1


func _start_new_game() -> void:
    hud.set_parts(0)
    _toggle_menu(game_menu)
    new_game_started.emit()
