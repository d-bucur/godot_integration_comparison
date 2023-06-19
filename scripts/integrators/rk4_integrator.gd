extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	var dt_half = dt * 0.5
	var v1 = linear_velocity
	var p1 = position

	# sample 1
	var a1 = acceleration.eval(0, p1)
	var v2 = v1 + dt_half * a1
	var p2 = p1 + dt_half * v2

	# sample 2
	var a2 = acceleration.eval(dt_half, p2)
	var v3 = v1 + dt_half * a2
	var p3 = p1 + dt_half * v3

	# sample 3
	var a3 = acceleration.eval(dt_half, p3)
	var v4 = v1 + dt * a3
	var p4 = p1 + dt * v4

	# sample 4
	var a4 = acceleration.eval(dt, p4)
	linear_velocity += dt * (a1 + 2*a2 + 2*a3 + a4)/6
	position += dt * (v1 + 2*v2 + 2*v3 + v4)/6
	
