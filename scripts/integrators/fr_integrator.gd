extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false
const theta := 1.351207191959657634047687
@onready var theta_1 := 1 - theta
@onready var theta_2 := 1 - 2 * theta

func _physics_process(dt: float) -> void:
	if sleeping:
		return
	
	PerfMonitor.log_start("fr")
	var dt_half = dt * 0.5
	var a = theta * dt
	var b = theta * dt_half
	var c = theta_1 * dt_half
	var d = theta_2 * dt
	
	position += b * linear_velocity

	linear_velocity += a * acceleration.eval(a, position)
	position += c * linear_velocity

	linear_velocity += d * acceleration.eval(d, position) # this technically goes back in time
	position += c * linear_velocity

	linear_velocity += a * acceleration.eval(a, position)
	position += b * linear_velocity

	PerfMonitor.log_stop("fr")
