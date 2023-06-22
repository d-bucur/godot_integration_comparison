extends Node2D

@export var linear_velocity := Vector2(200, -2000)

var acceleration := Vector2.ZERO
var sleeping := false

func apply_central_force(f: Vector2):
	acceleration += f  # weightless

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	PerfMonitor.log_start("sie")
	linear_velocity += acceleration * dt
	position += linear_velocity * dt
	acceleration = Vector2.ZERO
	PerfMonitor.log_stop("sie")
