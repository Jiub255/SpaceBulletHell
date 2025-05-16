class_name ShipMenu
extends Menu


var _game_state : GameState
var _guns_path : String = 'res://guns/gun_datas/'
var _button_scene : PackedScene = load(UIDs.WEAPON_BUTTON)
var _gun_data : GunData
@onready var _build : Button = %Build
@onready var _parent : GridContainer = %ButtonParent
@onready var _selected : SelectedWeaponDisplay = %SelectedWeaponDisplay


func _ready():
	_build.pressed.connect(_build_weapon)


func open() -> void:
	setup_buttons()
	super()


func setup(state : GameState):
	_game_state = state


func setup_buttons() -> void:
	_clear_buttons()
	var dir_access : DirAccess = DirAccess.open(_guns_path)
	if dir_access:
		dir_access.list_dir_begin()
		var filename : String = dir_access.get_next()
		while filename != '':
			print(filename)
			var data : GunData = load(_guns_path + filename)
			_create_button(data)
			filename = dir_access.get_next()


func _clear_buttons() -> void:
	for child in _parent.get_children():
		child.queue_free()


func _create_button(data : GunData) -> void:
	var button : WeaponButton = _button_scene.instantiate() as WeaponButton
	_parent.add_child(button)
	button.setup(data)
	button.weapon_selected.connect(_select_weapon)


func _select_weapon(data : GunData) -> void:
	_gun_data = data
	_selected.setup(data)


func _build_weapon():
	if _game_state.parts >= _gun_data.cost:
		_game_state.parts -= _gun_data.cost
		_game_state.weapons.append(_gun_data)
