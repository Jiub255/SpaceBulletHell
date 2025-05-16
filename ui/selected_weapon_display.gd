class_name SelectedWeaponDisplay
extends PanelContainer


@onready var _name : Label = %Name
@onready var _damage : Label = %Damage
@onready var _rate : Label = %Rate
@onready var _dps : Label = %DPS
@onready var _cost : Label = %Cost
@onready var _icon : TextureRect = %Icon
@onready var _description : Label = %Description


func setup(data : GunData) -> void:
	_name.text = data.name
	_damage.text = f'Damage: {data.damage}'
	_rate.text = f'Rate of Fire: {data.rate}'
	_dps.text = f'DPS: {data.dps}'
	_cost.text = f'Cost: {data.cost}'
	_icon.texture = data.icon
	_description.text = data.description
