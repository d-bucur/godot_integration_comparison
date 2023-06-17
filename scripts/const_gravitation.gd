extends Node

@export var g := Vector2(0, 980)

func _physics_process(delta: float) -> void:
	get_parent().add_force(g)