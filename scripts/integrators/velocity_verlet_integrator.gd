extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var accel_old = Vector2.ZERO # TODO will lag behind in tests
var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	PerfMonitor.log_start("vv")
	var dt_half = dt / 2
	position += dt * (linear_velocity + accel_old * dt_half)
	var accel = acceleration.eval(dt, position)
	linear_velocity += dt_half * (accel + accel_old)
	accel_old = accel
	PerfMonitor.log_stop("vv")