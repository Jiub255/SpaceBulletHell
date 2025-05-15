class_name EnemyData
extends Resource


@export var max_health : int = 1
@export_range(100, 1000) var speed : int = 5
@export var projectile_speed : int = 350
@export var bullet_data : BulletData
@export var time_between_shots : float = 1.0
@export var collision_damage : int = 5
@export var parts : int = 1 # Credits are the game's currency, sci-fi style.
