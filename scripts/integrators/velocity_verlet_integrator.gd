extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var accel_old = Vector2.ZERO # TODO will lag behind in tests
var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	position += linear_velocity * dt + accel_old * dt * dt * 0.5
	var accel = acceleration.eval(dt, self)
	linear_velocity += (accel + accel_old) * (dt * 0.5)
	accel_old = accel
