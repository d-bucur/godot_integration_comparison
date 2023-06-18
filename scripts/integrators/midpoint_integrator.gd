extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false

func vel(t: float, p: Vector2) -> Vector2:
	return linear_velocity + acceleration.eval(t, p) * t

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	# TODO optimize
	var dt_half = dt / 2
	var vel_new = linear_velocity + dt * acceleration.eval(dt_half, position + dt_half * linear_velocity)
	position += dt * vel(dt_half, position + dt_half * linear_velocity)
	linear_velocity = vel_new
