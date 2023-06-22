extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var acceleration: AccelerationProvider

var sleeping := false
var theta := 1.35120719195966

func _physics_process(dt: float) -> void:
	if sleeping:
		return

	var dt_half = dt * 0.5
	
	position += theta * dt_half * linear_velocity

	linear_velocity += theta * dt * acceleration.eval(theta * dt, position)
	position += (1 - theta) * dt_half * linear_velocity

	linear_velocity += (1 - 2*theta) * dt * acceleration.eval((1 - 2*theta), position) # TODO time not right
	position += (1 - theta) * dt_half * linear_velocity # same step as above

	linear_velocity += theta * dt * acceleration.eval(theta * dt, position)
	position += theta * dt_half * linear_velocity
