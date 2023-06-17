extends Node

@export var g := Vector2(0, 980)

func _physics_process(delta: float) -> void:
	get_parent().apply_central_force(g)