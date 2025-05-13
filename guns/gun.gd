class_name Gun
extends Sprite2D


const _bullet_scene : PackedScene = preload(UIDs.BULLET)

var _timer : float = 0
var _time_between_shots : float = 1


func _ready() -> void:
    _timer = _time_between_shots


func _process_gun(delta):
    _timer -= delta
    if _timer <= 0:
        _timer = _time_between_shots
        _shoot()


func _shoot():
    var bullet : Bullet = _bullet_scene.instantiate() as Bullet
    add_child(bullet)
    #bullet.position = Vector2.ZERO
