class_name Bullet
extends Area2D


const SPEED : float = 1000


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(other_area : Area2D):
	if other_area is Enemy:
		pass
	print('Other area: {other}'.format({"other" : other_area.name}))


func _physics_process(delta: float) -> void:
	position += Vector2.UP * SPEED * delta
