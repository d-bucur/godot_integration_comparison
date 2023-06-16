extends Node2D

@export var linear_velocity: Vector2
@export var acceleration: Vector2

var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return
	var dv = acceleration * dt
	position += (linear_velocity + dv * 0.5) * dt
	linear_velocity += dv
