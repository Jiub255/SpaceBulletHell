class_name Ship
extends CharacterBody2D


signal health_changed(int)

var _data : ShipData
var _health : int
var _guns : Array[Gun] = []
var _slots : Array[Node2D] = []
var _gun_scene : PackedScene = load(UIDs.GUN)


func _ready() -> void:
	for gunslot in $Guns.get_children():
		if gunslot is Node2D:
			_slots.append(gunslot)


func _physics_process(delta : float) -> void:
	_move()
	_handle_weapons(delta)
	_rotate(delta)


func setup(data: ShipData, state : ShipState) -> void:
	_data = data
	_health = min(state.health, data.max_health)
	for i in range(len(state.guns)):
		var gun = _gun_scene.instantiate() as Gun
		_slots[i].add_child(gun)
		gun.setup(state.guns[i])
		_guns.append(gun)
		#print(f'Gun: {gun}')


func get_hit(damage : int) -> void:
	_health -= damage
	health_changed.emit(max(0, _health))
	if _health <= 0:
		_die()


func _die() -> void:
	print('died')


func get_health() -> int:
	return _health


func _move() -> void:
	var direction : Vector2 = Input.get_vector(
		InputNames.LEFT,
		InputNames.RIGHT,
		InputNames.UP,
		InputNames.DOWN)
	velocity = direction.normalized() * _data.speed
	move_and_slide()


func _rotate(delta : float) -> void:
	rotate(deg_to_rad(_data.rotation_speed) * delta)


func _handle_weapons(delta : float) -> void:
	for gun in _guns:
		gun.process_gun(delta)

	if Input.is_action_just_pressed(InputNames.WEAPON_1):
		# TODO: Shoot special weapon #1
		print('Weapon 1')
	if Input.is_action_just_pressed(InputNames.WEAPON_2):
		# TODO: Shoot special weapon #2
		print('Weapon 2')
	if Input.is_action_just_pressed(InputNames.WEAPON_3):
		# TODO: Shoot special weapon #3
		print('Weapon 3')
