extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false
var theta := 1.351207191959657634047687

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	var dt_half = dt * 0.5
	var a = theta * dt
	var b = theta * dt_half
	var c = (1 - theta) * dt_half
	var d = (1 - 2 * theta) * dt
	
	position += b * linear_velocity

	linear_velocity += a * acceleration.eval(a, position)
	position += c * linear_velocity

	linear_velocity += d * acceleration.eval(d, position)
	position += c * linear_velocity

	linear_velocity += a * acceleration.eval(a, position)
	position += b * linear_velocity
