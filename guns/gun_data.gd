class_name GunData
extends Resource


@export var bullet_data : BulletData
@export_range(0.001, 10) var time_between_shots : float = 1
@export_range(200, 5000) var projectile_speed : int = 200
@export_range(0, 64) var muzzle_height : int = 0
@export var sprite : Texture2D
@export_range(1, 10000) var cost : int

var damage : int:
    get:
        return bullet_data.damage

var rate : float:
    get:
        return 1 / time_between_shots

var dps : float:
    get:
        return damage * rate
