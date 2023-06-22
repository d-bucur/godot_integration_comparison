extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false
var lambda := -0.2123418310626054 # λ
var xi := 0.1786178958448091 # ξ
var chi := -0.06626458266981849 # χ

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	PerfMonitor.log_start("pefrl")
	var dt_half = dt * 0.5
	
	position += xi * dt * linear_velocity

	var h = (1 - 2 * lambda) * dt_half
	linear_velocity += h * acceleration.eval(h, position)
	position += chi * dt * linear_velocity

	h = lambda * dt
	linear_velocity += h * acceleration.eval(h, position) # this technically goes back in time
	position += (1 - 2 * (chi + xi)) * dt * linear_velocity

	linear_velocity += h * acceleration.eval(h, position)
	position += chi * dt * linear_velocity

	h = (1 - 2 * lambda) * dt_half
	linear_velocity += h * acceleration.eval(h, position)
	position += xi * dt * linear_velocity
	
	PerfMonitor.log_stop("pefrl")