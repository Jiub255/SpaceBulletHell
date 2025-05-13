class_name BulletData
extends Resource


@export var damage : int = 1
@export var speed : int = 333
@export var sprite : Texture2D

var size : float:
    get:
        return sprite.get_height() + 2
