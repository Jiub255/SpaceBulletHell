class_name Gun
extends Sprite2D


@export var _data : GunData
var _timer : float = 0
var _bullet_scene : PackedScene = load(UIDs.BULLET)


func setup(gun_data : GunData) -> void:
	_data = gun_data
	_timer = gun_data.time_between_shots
	texture = gun_data.sprite


func process_gun(delta) -> void:
	_timer -= delta
	if _timer <= 0:
		_timer = _data.time_between_shots
		await get_tree().process_frame
		_shoot()


func _shoot() -> void:
	var bullet = _bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.collision_mask = 0b10
	bullet.global_position = to_global(position + Vector2(0, -_data.muzzle_height))
	bullet.setup(_data.bullet_data)
	# TODO: Change rotated amount based on rotation speed?
	bullet.launch(global_rotation + deg_to_rad(30), _data.projectile_speed)
	var _tween = create_tween()
	_tween.parallel().tween_property(self, "scale:x", 1.2, 0.1)
	_tween.tween_property(self, "scale:y", 0.85, 0.1)
	_tween.parallel().tween_property(self, "scale:x", 1, 0.1)
	_tween.tween_property(self, "scale:y", 1, 0.1)
