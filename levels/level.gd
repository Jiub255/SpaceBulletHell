class_name Level
extends Node2D


signal health_changed(health : int)

const TIME_BETWEEN_SPAWNS : float = 3.0

var player : Ship
var _game_state : GameState
var _timer : float
var _enemy_1 : PackedScene = load(UIDs.ENEMY_1)
var _enemy_2 : PackedScene = load(UIDs.ENEMY_2)


func _physics_process(delta: float) -> void:
	_timer -= delta
	if _timer < 0:
		_timer = TIME_BETWEEN_SPAWNS
		spawn_enemy()


func start_level(game_state : GameState) -> void:
	_game_state = game_state
	player = load(UIDs.SHIP).instantiate()
	add_child(player)
	player.position = Vector2(890, 540)
	player.health_changed.connect(_set_health)
	_set_health(player.get_health())
	# Starting with first ship in list for now.
	player.setup(_game_state.ship_infos[0].data, _game_state.ship_infos[0].state)
	_timer = TIME_BETWEEN_SPAWNS


func add_parts(amount : int) -> void:
	_game_state.parts += amount


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


func _set_health(health : int) -> void:
	health_changed.emit(health)
