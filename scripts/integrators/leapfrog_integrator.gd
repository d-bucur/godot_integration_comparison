extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false

func _ready() -> void:
	# kickstart velocity to half step
	var dt_half = 0.5/Engine.physics_ticks_per_second
	linear_velocity += dt_half * acceleration.eval(dt_half, position)

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	PerfMonitor.log_start("leap")
	var accel_new = acceleration.eval(dt, position)
	linear_velocity += accel_new * dt
	position += linear_velocity * dt
	PerfMonitor.log_stop("leap")
