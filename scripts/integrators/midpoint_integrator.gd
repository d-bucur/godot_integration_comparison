extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	var dt_half = dt / 2
	var accel = acceleration.eval(dt_half, position + dt_half * linear_velocity)
	position += dt * (linear_velocity + accel * dt_half)
	linear_velocity = linear_velocity + dt * accel
