class_name GameState
# For storing all game state during gameplay, and for saving/loading.
# Keep ships with their state's saved, parts, etc.
# For ships, can't do dicts with non-constant keys? Just make an inner class to hold it all?
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

var ship_infos : Array[ShipInfo] = []


func _init():
	var ship_info = ShipInfo.new(Ships.SHIP_1, ShipState.new())
	ship_infos = [ship_info]
