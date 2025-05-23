class_name Enemy
extends Area2D


signal enemy_died(parts : int)

@export var _data : EnemyData
var _health : int
var _timer : float = 0
var _player : Ship
var _bullet_scene : PackedScene = preload(UIDs.BULLET)
var _tree : SceneTree


func _ready() -> void:
	_health = _data.max_health
	_timer = _data.time_between_shots
	_tree = get_tree()
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	_tick_shoot(delta)
	_move(delta)


func setup(player : Ship) -> void:
	_player = player


func get_hit(damage : int) -> void:
	_health -= damage
	print(f'Enemy {name} hit for {damage} damage, down to {_health} health.')
	if _health <= 0:
		_die()


func _on_body_entered(body : CollisionObject2D) -> void:
	if body is Ship:
		body.get_hit(_data.collision_damage)
		_die()


func _tick_shoot(delta : float) -> void:
	_timer -= delta
	if (_timer < 0):
		_timer = _data.time_between_shots
		_shoot()


func _shoot() -> void:
	#print(f'shoot, rotation: {rad_to_deg(global_rotation)}')
	var bullet : Bullet = _bullet_scene.instantiate() as Bullet
	_tree.current_scene.add_child(bullet)
	bullet.collision_mask = 0b1
	bullet.global_position = global_position
	bullet.setup(_data.bullet_data)
	bullet.launch_dir((_player.position - position).normalized(), _data.projectile_speed)


func _move(delta : float) -> void:
	var direction : Vector2 = (_player.position - position).normalized()
	position += direction * _data.speed * delta


func _die() -> void:
	# TODO: Blowup animation/shader/particle effects
	enemy_died.emit(_data.parts)
	queue_free()
