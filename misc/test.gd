extends Node2D

@export var bullet_scene: PackedScene

func _ready():
    print("Scene: ", bullet_scene)
    var bullet = bullet_scene.instantiate()
    print("Instantiated bullet: ", bullet)
    add_child(bullet)
