class_name Bullet
extends Area2D


@export var _data : BulletData
var _direction : Vector2


func _ready():
	area_entered.connect(_on_area_entered)
	%Sprite2D.texture = _data.sprite
	_set_collision_radius()


func _physics_process(delta: float) -> void:
	position += _direction * _data.speed * delta


func launch(rotation_rads):
	_direction = Vector2.UP.rotated(rotation_rads)


func _on_area_entered(other_area : Area2D):
	if other_area is Enemy:
		pass
	print(f'Other area: {other_area.name}, damage: {_data.damage}')


func _set_collision_radius():
	var circle : CircleShape2D = CircleShape2D.new()
	circle.radius = _data.size / 2
	%CollisionShape2D.shape = circle
