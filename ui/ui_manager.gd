class_name UiManager
extends Node


signal toggle_pause(pause : bool)
signal new_game_started()

var _menus_open : int = 1:
	set(value):
		_menus_open = value
		print(f'menus open: {value}')
		if _menus_open == 0:
			toggle_pause.emit(false)
		else:
			toggle_pause.emit(true)

@onready var hud : HUD = %HUD
@onready var game_menu : GameMenu = %GameMenu
@onready var ship_menu : ShipMenu = %ShipMenu


func _ready() -> void:
	ship_menu.setup_buttons()
	game_menu.new_game_started.connect(_start_new_game)


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(InputNames.GAME_MENU):
		_toggle_menu(game_menu)
	elif not game_menu.visible and Input.is_action_just_pressed(InputNames.SHIP_MENU):
		_toggle_menu(ship_menu)


func setup(game_state : GameState) -> void:
	hud.setup(game_state)
	ship_menu.setup(game_state)


func _toggle_menu(menu : Menu) -> void:
	if menu.visible:
		menu.close()
		_menus_open -= 1
	else:
		menu.open()
		_menus_open += 1


func _start_new_game() -> void:
	_toggle_menu(game_menu)
	new_game_started.emit()
