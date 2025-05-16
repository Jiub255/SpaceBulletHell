class_name WeaponButton
extends Button


signal weapon_selected(data : GunData)

var _data : GunData


func setup(data : GunData) -> void:
	_data = data
	pressed.connect(_select_weapon)


func _select_weapon() -> void:
	weapon_selected.emit(_data)
