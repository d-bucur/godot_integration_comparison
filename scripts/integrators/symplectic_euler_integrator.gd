extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	PerfMonitor.log_start("sie")
	linear_velocity += acceleration.eval(dt, position) * dt
	position += linear_velocity * dt
	PerfMonitor.log_stop("sie")
