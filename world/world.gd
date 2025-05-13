class_name World
extends Node2D


const ENEMY_1 : PackedScene = preload(UIDs.ENEMY_1)
const ENEMY_2 : PackedScene = preload(UIDs.ENEMY_2)
const TIME_BETWEEN_SPAWNS : float = 3.0

var player : Ship
var credits : int
var _timer : float
@onready var _hud = %HUD


func _ready():
	player = load(UIDs.SHIP).instantiate()
	add_child(player)
	player.position = Vector2(890, 540)
	_timer = TIME_BETWEEN_SPAWNS
	_hud.set_credits(credits)


func _physics_process(delta: float) -> void:
	_timer -= delta
	if _timer < 0:
		_timer = TIME_BETWEEN_SPAWNS
		spawn_enemy()


func add_credits(amount : int):
	credits += amount
	_hud.set_credits(credits)


func spawn_enemy():
	var rando = randi() % 2
	var enemy
	if rando == 0:
		enemy = ENEMY_1.instantiate()
	else:
		enemy = ENEMY_2.instantiate()
	add_child(enemy)
	enemy.position.y -= 600
	enemy.setup(player)
	enemy.enemy_died.connect(add_credits)
