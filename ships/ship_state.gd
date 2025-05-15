class_name ShipState
# For storage of all state variables during gameplay and for saving/loading.

# TODO: Don't keep ShipData on ShipState.
# Store them together somehow though?
#var ship_data : ShipData
var guns : Array[GunData]
var health : int

func _init(guns_ : Array[GunData] = [Guns.GUN_1], health_ : int = 99999999) -> void:
    guns = guns_
    health = health_
