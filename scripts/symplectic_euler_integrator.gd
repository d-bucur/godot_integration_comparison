extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration := Vector2(0, 980)

var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return
	linear_velocity += acceleration * dt
	position += linear_velocity * dt
