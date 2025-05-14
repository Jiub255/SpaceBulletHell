class_name Bullet
extends Area2D


var _direction : Vector2
var _speed : int
var _damage : int


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	position += _direction * _speed * delta


func setup(data : BulletData):
	%Sprite2D.texture = data.sprite
	_set_collision_radius(data)
	_damage = data.damage


func launch(rotation_rads : float, speed : int) -> void:
	_direction = Vector2.UP.rotated(rotation_rads)
	_speed = speed


func launch_dir(direction : Vector2, speed : int) -> void:
	#print(f'angle: {rad_to_deg(Vector2.UP.angle_to(direction))}')
	_direction = direction
	_speed = speed


func _on_area_entered(area : Area2D) -> void:
	if area is Enemy:
		area.get_hit(_damage)
		queue_free()
	#print(f'Other area: {other_area.name}, damage: {_data.damage}')


func _on_body_entered(body : CollisionObject2D) -> void:
	if body is Ship:
		body.get_hit(_damage)
		queue_free()


func _set_collision_radius(data : BulletData) -> void:
	var circle : CircleShape2D = CircleShape2D.new()
	circle.radius = data.size / 2
	%CollisionShape2D.shape = circle
