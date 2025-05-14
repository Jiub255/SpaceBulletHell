class_name Gun
extends Sprite2D


@export var _data : GunData
var _timer : float = 0


func _ready() -> void:
	_setup_gun(_data)


func process_gun(delta) -> void:
	_timer -= delta
	if _timer <= 0:
		_timer = _data.time_between_shots
		_shoot()


func _setup_gun(gun_data : GunData) -> void:
	_timer = gun_data.time_between_shots
	texture = gun_data.sprite


func _shoot() -> void:
	#print(f'shoot, rotation: {rad_to_deg(global_rotation)}')
	var bullet : Bullet = _data.bullet_scene.instantiate() as Bullet
	get_tree().root.get_child(0).add_child(bullet)
	bullet.collision_mask = 0b10
	bullet.global_position = global_position
	bullet.launch(global_rotation)
