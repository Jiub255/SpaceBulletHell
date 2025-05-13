class_name Ship
extends CharacterBody2D


var _speed : int = 400
var _guns : Array[Gun] = []


func _ready() -> void:
	for gunslot in $Guns.get_children():
		if gunslot.get_child_count() > 0:
			_guns.append(gunslot.get_child(0))


func _process(delta : float) -> void:
	_move()
	_handle_weapons(delta)


func _move() -> void:
	var direction : Vector2 = Input.get_vector(
		InputNames.LEFT,
		InputNames.RIGHT,
		InputNames.UP,
		InputNames.DOWN)
	velocity = direction * _speed
	move_and_slide()


func _handle_weapons(delta : float) -> void:
	for gun in _guns:
		gun._process_gun(delta)

	if Input.is_action_just_pressed(InputNames.WEAPON_1):
		# TODO: Shoot special weapon #1
		print('Weapon 1')
	if Input.is_action_just_pressed(InputNames.WEAPON_2):
		# TODO: Shoot special weapon #2
		print('Weapon 2')
	if Input.is_action_just_pressed(InputNames.WEAPON_3):
		# TODO: Shoot special weapon #3
		print('Weapon 3')
