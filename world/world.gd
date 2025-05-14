class_name World
extends Node2D


const ENEMY_1 : PackedScene = preload(UIDs.ENEMY_1)
const ENEMY_2 : PackedScene = preload(UIDs.ENEMY_2)
const TIME_BETWEEN_SPAWNS : float = 3.0

var player : Ship
var parts : int
var _timer : float
@onready var _hud = %HUD


func _ready() -> void:
	player = load(UIDs.SHIP).instantiate()
	add_child(player)
	player.position = Vector2(890, 540)
	player.health_changed.connect(set_health)
	set_health(player.get_health())
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
		enemy = ENEMY_1.instantiate()
	else:
		enemy = ENEMY_2.instantiate()
	add_child(enemy)
	enemy.position.y -= 600
	enemy.setup(player)
	enemy.enemy_died.connect(add_parts)


func set_health(health : int):
	_hud.set_health(health)
