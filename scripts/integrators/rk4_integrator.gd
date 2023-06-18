extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	var v1 = linear_velocity
	var p1 = position

	var a1 = acceleration.eval(0, p1)
	var v2 = v1 + dt * 0.5 * a1
	var p2 = p1 + dt * 0.5 * v2

	var a2 = acceleration.eval(0, p2)
	var v3 = v1 + dt * 0.5 * a2
	var p3 = p1 + dt * 0.5 * v3

	var a3 = acceleration.eval(0, p3)
	var v4 = v1 + dt * a3
	var p4 = p1 + dt * v4

	var a4 = acceleration.eval(0, p4)
	linear_velocity += dt * (a1 + 2*a2 + 2*a3 + a4)/6
	position += dt * (v1 + 2*v2 + 2*v3 + v4)/6
	
