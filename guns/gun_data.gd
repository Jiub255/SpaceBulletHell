class_name GunData
extends Resource


@export var name : String
@export var bullet_data : BulletData
@export_range(0.001, 10) var time_between_shots : float = 1
@export_range(500, 5000) var projectile_speed : int = 500
@export_range(0, 64) var muzzle_height : int = 0
@export var icon : Texture2D
@export var cost : int
@export var description : String

var damage : int:
    get:
        return bullet_data.damage

var rate : float:
    get:
        return 1 / time_between_shots

var dps : float:
    get:
        return damage * rate
