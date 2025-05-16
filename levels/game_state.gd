class_name GameState


class ShipInfo:
	var data : ShipData
	var state : ShipState
	func _init(data_ : ShipData, state_ : ShipState):
		data = data_
		state = state_


signal parts_changed(parts : int)


var parts : int:
	get:
		return parts
	set(value):
		parts = value
		parts_changed.emit(value)

# TODO: How to emit signal when arrays are changed?
var ship_infos : Array[ShipInfo]
var ship_index : int = 0
var weapons : Array[GunData]


func _init() -> void:
	var ship_info = ShipInfo.new(Ships.SHIP_1, ShipState.new())
	ship_infos = [ship_info]
	weapons = []



