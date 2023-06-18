extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var accel_old = Vector2.ZERO # TODO will lag behind in tests
var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	var dt_half = dt * 0.5
	var accel_new = acceleration.eval(dt, position)
	position += dt * (linear_velocity + accel_new * dt_half)
	linear_velocity += dt_half * (accel_new + accel_old)
	accel_old = accel_new
