extends Node2D

@export var linear_velocity := Vector2(200, -2000)
@export var gravity := Vector2(0, 980)

var acceleration = null

var sleeping := false

func _integrate_forces(_dt: float) -> Vector2:
	return gravity # constant force in this example

func _physics_process(dt: float) -> void:
	if sleeping:
		return
	
	# branch only used on first frame for accurate testing. in outside usage this can probably be skipped
	var old_accel = acceleration if acceleration != null else _integrate_forces(dt)
	var dt_half = dt * 0.5
	position += (linear_velocity + old_accel * dt_half) * dt
	acceleration = _integrate_forces(dt) # ignoring mass
	linear_velocity += (acceleration + old_accel) * dt_half
