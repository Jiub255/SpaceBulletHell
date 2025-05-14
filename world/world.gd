class_name World
extends Node2D


const TIME_BETWEEN_SPAWNS : float = 3.0

var player : Ship
var parts : int
var _timer : float
var _enemy_1 : PackedScene = load(UIDs.ENEMY_1)
var _enemy_2 : PackedScene = load(UIDs.ENEMY_2)
@onready var _hud = %HUD


func _ready() -> void:
	player = load(UIDs.SHIP).instantiate()
	add_child(player)
	player.position = Vector2(890, 540)
	player.health_changed.connect(set_health)
	set_health(player.get_health())

	# Test-starter ship for now
	var state : ShipState = ShipState.new(Ships.SHIP_1, [Guns.GUN_1, Guns.GUN_2, Guns.GUN_3], 20)
	player.setup(state)

	_timer = TIME_BETWEEN_SPAWNS
	_hud.set_parts(parts)


func _physics_process(delta: float) -> void:
	_timer -= delta
	if _timer < 0:
		_timer = TIME_BETWEEN_SPAWNS
		spawn_enemy()


func add_parts(amount : int) -> void:
	parts += amount
	_hud.set_parts(parts)


func spawn_enemy() -> void:
	var rando = randi() % 2
	var enemy
	if rando == 0:
		enemy = _enemy_1.instantiate()
	else:
		enemy = _enemy_2.instantiate()
	add_child(enemy)
	enemy.position = Vector2(960, -150)
	enemy.setup(player)
	enemy.enemy_died.connect(add_parts)


func set_health(health : int):
	_hud.set_health(health)
