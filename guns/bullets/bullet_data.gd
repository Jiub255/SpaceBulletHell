class_name BulletData
extends Resource


@export var damage : int = 1
@export var sprite : Texture2D
# TODO: Implement knockback.

var size : float:
    get:
        return sprite.get_height() + 2
