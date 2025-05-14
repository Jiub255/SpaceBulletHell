class_name ShipState

var ship_data : ShipData
var guns : Array[GunData]
var health : int

func _init(data : ShipData, guns_ : Array[GunData], health_ : int):
    ship_data = data
    guns = guns_
    health = health_
