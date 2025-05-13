class_name Bullet
extends Area2D


@export var _data : BulletData
var _direction : Vector2


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)
	%Sprite2D.texture = _data.sprite
	_set_collision_radius()


func _physics_process(delta: float) -> void:
	position += _direction * _data.speed * delta


func launch(rotation_rads : float) -> void:
	_direction = Vector2.UP.rotated(rotation_rads)


func launch_dir(direction : Vector2):
	_direction = direction


func _on_area_entered(area : Area2D) -> void:
	if area is Enemy:
		area.get_hit(_data.damage)
		queue_free()
	#print(f'Other area: {other_area.name}, damage: {_data.damage}')


func _on_body_entered(body : CollisionObject2D) -> void:
	if body is Ship:
		body.get_hit(_data.damage)
		queue_free()


func _set_collision_radius() -> void:
	var circle : CircleShape2D = CircleShape2D.new()
	circle.radius = _data.size / 2
	%CollisionShape2D.shape = circle
